//
//  MovieListDownloader.swift
//  Course Materials
//
//  Created by Matt Beaney on 01/03/2023.
//

import Foundation

protocol MovieListGatewayDelegate: AnyObject {
	
	func didReceiveNewMovies(_ movies: [Movie])
}

class MovieListGateway {
	
	weak var delegate: MovieListGatewayDelegate?
	
	let requestFactory: RequestFactory
	let networkManager: NetworkManager
	let socketManager: SocketEventManager
	
	init(
		requestFactory: RequestFactory,
		networkManager: NetworkManager,
		socketManager: SocketEventManager
	) {
		self.requestFactory = requestFactory
		self.networkManager = networkManager
		self.socketManager = socketManager
	}
	
	func fetchMovies() async throws -> MovieResponse {
		
		self.socketManager.delegate = self
		self.socketManager.startListening()
		let request = try requestFactory.request(for: .movieList)
		return try await networkManager.performRequest(request)
	}
}

extension MovieListGateway: SocketEventManagerDelegate {
	
	func didReceiveNewMovies(_ movies: [Movie]) {
		
		self.delegate?.didReceiveNewMovies(movies)
	}
}
