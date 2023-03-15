//
//  UIApplication+UITestingHelpers.swift
//  Course Materials
//
//  Created by Matt Beaney on 08/03/2023.
//

import UIKit

public extension UIApplication {
	
	var isRunningUITests: Bool {
		let isUITestString = ProcessInfo.processInfo.environment["isUITest"]
		return Bool(string: isUITestString) ?? false
	}
}

private extension Bool {
	
	init?(string: String?) {
		
		guard
			let string = string,
			let bool = Bool(string)
		else {
			return nil
		}
		
		self = bool
	}
}
