//
//  SocketManager.swift
//  Course Materials
//
//  Created by Matt Beaney on 11/03/2023.
//

import Foundation
import SocketIO

protocol SocketEventManagerDelegate: AnyObject {
	
	func didReceiveNewMovies(_ movies: [Movie])
}

class SocketEventManager {
	
	weak var delegate: SocketEventManagerDelegate?
	private var socketManager: SocketManager?
		
	init() {
		
	}
	
	func startListening() {
		
		guard let baseUrl = URL(string: BaseUrlManager.baseUrl) else {
			return
		}
		
		let mockedSockets = true
		
		self.socketManager = SocketManager(
			socketURL: baseUrl,
			config: [
				"log" : false,
				"path": mockedSockets ? "/socket.io" : "/ws",
				"version": 2,
				"forcePolling": mockedSockets,
				"forceWebsockets": !mockedSockets
			]
		)
		
		self.socketManager?.defaultSocket.connect(timeoutAfter: 5.0) { [weak self] in
			print("Failed connection")
		}
		
		self.socketManager?.defaultSocket.on("movie") { [weak self] data, _ in
			self?.handleSocketData(data: data)
		}
	}
	
	private func handleSocketData(data: [Any]) {
		
		guard let dictionaryArray = data.first as? [[String: Any]] else {
			return
		}
		
		let movies: [Movie] = dictionaryArray.compactMap { dictionary in
			
			guard
				let data = try? JSONSerialization.data(withJSONObject: dictionary, options: [])
			else {
				return nil
			}
			
			let jsonDecoder = JSONDecoder()
			jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
			return try? jsonDecoder.decode(Movie.self, from: data)
		}
		
		self.delegate?.didReceiveNewMovies(movies)
	}
}
