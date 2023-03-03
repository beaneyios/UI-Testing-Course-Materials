//
//  AppCoordinator.swift
//  Course Materials
//
//  Created by Matt Beaney on 28/02/2023.
//

import UIKit

class AppCoordinator {
	
	private let navigationController: UINavigationController
	
	init(navigationController: UINavigationController) {
		self.navigationController = navigationController
	}
	
	func start() {		
		self.styleNavigationBar()
		self.navigateToLogin()
	}
	
	private func styleNavigationBar() {
		let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
		self.navigationController.navigationBar.titleTextAttributes = textAttributes
		self.navigationController.navigationBar.barTintColor = UIColor(named: "Custom_Orange")
		self.navigationController.navigationBar.tintColor = .white
	}
	
	private func navigateToLogin() {
		
		let storyboard = UIStoryboard(name: "Main", bundle: nil)
		
		guard
			let viewController = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController
		else {
			return
		}
		
		viewController.viewModel = LoginViewModel(
			gateway: LoginGateway(
				requestFactory: RequestFactory(baseUrl: BaseUrlManager.baseUrl),
				networkManager: NetworkManager()
			),
			delegate: self
		)
		self.navigationController.setViewControllers([viewController], animated: true)
	}
	
	private func navigateToList() {
		
		let storyboard = UIStoryboard(name: "Main", bundle: nil)
		
		guard
			let viewController = storyboard.instantiateViewController(withIdentifier: "MovieListViewController") as? MovieListViewController
		else {
			return
		}
		
		let viewModel = MovieListViewModel(
			downloader: MovieListGateway(
				requestFactory: RequestFactory(baseUrl: BaseUrlManager.baseUrl),
				networkManager: NetworkManager()
			),
			delegate: self
		)
		
		viewController.title = "Your movies"
		viewController.viewModel = viewModel		
		self.navigationController.setViewControllers([viewController], animated: true)
	}
	
	private func navigateToMovie(_ movie: Movie) {
		
		let storyboard = UIStoryboard(name: "Main", bundle: nil)
		
		guard
			let viewController = storyboard.instantiateViewController(withIdentifier: "MovieDetailViewController") as? MovieDetailViewController
		else {
			return
		}

		viewController.title = movie.title
		viewController.movie = movie
		self.navigationController.pushViewController(viewController, animated: true)
	}
}

extension AppCoordinator: LoginPageDelegate {
	
	func loginPageDidLogIn() {
		self.navigateToList()
	}
}

extension AppCoordinator: MovieListDelegate {
	
	func movieListDidSelectMovie(_ movie: Movie) {
		self.navigateToMovie(movie)
	}
}
