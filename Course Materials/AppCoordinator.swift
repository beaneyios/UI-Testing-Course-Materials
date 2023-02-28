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
		self.navigateToLogin()
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
}
