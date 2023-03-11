//
//  MovieListViewModel.swift
//  Course Materials
//
//  Created by Matt Beaney on 01/03/2023.
//

import Foundation

protocol MovieListDelegate: AnyObject {
	
	func movieListDidSelectMovie(_ movie: Movie)
}

class MovieListViewModel {
	
	weak var delegate: MovieListDelegate?
	
	@Published var cellModels: [MovieListCellModel] = []
	private var movies = [Movie]()
	private let downloader: MovieListGateway
	
	init(
		downloader: MovieListGateway,
		delegate: MovieListDelegate
	) {
		self.downloader = downloader
		self.delegate = delegate
	}
	
	@MainActor
	func loadData() {
		
		Task {
			do {
				self.downloader.delegate = self
				let movies = try await self.downloader.fetchMovies().movies
				self.movies = movies
				
				self.reloadCellModels()
			} catch {
				print(error)
			}
		}
	}
	
	func didSelectMovie(at indexPath: IndexPath) {
		
		let movie = self.movies[indexPath.row]
		self.delegate?.movieListDidSelectMovie(movie)
	}
	
	private func reloadCellModels() {
		
		self.cellModels = movies.map {
			MovieListCellModel(
				id: $0.id,
				posterUrl: $0.posterUrl,
				titleText: $0.title,
				plotText: $0.plot
			)
		}
	}
}

extension MovieListViewModel: MovieListGatewayDelegate {
	
	func didReceiveNewMovies(_ movies: [Movie]) {
		
		self.movies = self.movies.map { oldMovie in
			
			let newMovie = movies.first { newMovie in
				oldMovie.id == newMovie.id
			}
			
			if let newMovie {
				return newMovie
			} else {
				return oldMovie
			}
		}
		
		self.reloadCellModels()
	}
}
