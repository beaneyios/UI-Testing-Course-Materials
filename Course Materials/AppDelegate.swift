//
//  AppDelegate.swift
//  Course Materials
//
//  Created by Matt Beaney on 27/02/2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

	func application(
		_ application: UIApplication,
		didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
	) -> Bool {

		// If we're in UI test mode, we have no need for animations.
		// They marginally speed the tests up, and reduce flakiness.
		if UIApplication.shared.isRunningUITests {
			UIView.setAnimationsEnabled(false)
		}
			
		return true
	}
}

