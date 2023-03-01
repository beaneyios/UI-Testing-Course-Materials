//
//  MovieListDownloader.swift
//  Course Materials
//
//  Created by Matt Beaney on 01/03/2023.
//

import Foundation

struct MovieListDownloader {
	
	let requestFactory: RequestFactory
	let networkManager: NetworkManager
	
	func fetchMovies() async throws -> MovieResponse {
		
		let request = try requestFactory.request(for: .movieList)
		return try await networkManager.performRequest(request)
	}
}
