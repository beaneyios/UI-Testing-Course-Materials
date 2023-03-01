//
//  NetworkManager.swift
//  Course Materials
//
//  Created by Matt Beaney on 01/03/2023.
//

import Foundation

struct NetworkManager {
	
	func performRequest<T: Codable>(_ request: URLRequest) async throws -> T {
		
		let session = URLSession.shared
		let (data, _) = try await session.data(for: request)
		
		let decoder = JSONDecoder()
		decoder.keyDecodingStrategy = .convertFromSnakeCase
		return try decoder.decode(T.self, from: data)
	}
}
