//
//  MovieListViewModel.swift
//  Course Materials
//
//  Created by Matt Beaney on 01/03/2023.
//

import Foundation

class MovieListViewModel {
	
	@Published var cellModels: [MovieListCellModel] = []
	private var movies = [Movie]()
	
	private let downloader: MovieListDownloader
	
	init(downloader: MovieListDownloader) {
		self.downloader = downloader
	}
	
	@MainActor
	func loadData() {
		
		Task {
			do {
				let movies = try await self.downloader.fetchMovies().movies
				self.movies = movies
				
				self.cellModels = movies.map {
					MovieListCellModel(
						posterUrl: $0.posterUrl,
						titleText: $0.title,
						plotText: $0.plot
					)
				}
			} catch {
				print(error)
			}
		}
	}
}
