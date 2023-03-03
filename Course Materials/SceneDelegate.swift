//
//  SceneDelegate.swift
//  Course Materials
//
//  Created by Matt Beaney on 27/02/2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

	var window: UIWindow?
	private var coordinator: AppCoordinator?

	func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
		
		guard let windowScene = (scene as? UIWindowScene) else {
			return
		}
		
		let window = UIWindow(windowScene: windowScene)
		
		let navigationController = UINavigationController()
		window.rootViewController = navigationController
		self.window = window
		window.makeKeyAndVisible()
		
		self.coordinator = AppCoordinator(navigationController: navigationController)
		self.coordinator?.start()
	}
}

