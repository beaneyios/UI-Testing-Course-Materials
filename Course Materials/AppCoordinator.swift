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
		let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
		self.navigationController.navigationBar.titleTextAttributes = textAttributes
		self.navigationController.navigationBar.barTintColor = UIColor(named: "Custom_Orange")

		self.navigateToList()
	}
	
	private func navigateToLogin() {
		
		let storyboard = UIStoryboard(name: "Main", bundle: nil)
		
		guard
			let viewController = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController
		else {
			return
		}
		
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
			downloader: MovieListDownloader(
				requestFactory: RequestFactory(baseUrl: BaseUrlManager.baseUrl),
				networkManager: NetworkManager()
			)
		)
		
		viewController.title = "Your movies"
		viewController.viewModel = viewModel		
		self.navigationController.setViewControllers([viewController], animated: true)
	}
}
