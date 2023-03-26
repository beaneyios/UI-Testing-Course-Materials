//
//  XCUIApplication+Screenshot.swift
//  Course MaterialsUITests
//
//  Created by Matt Beaney on 08/03/2023.
//

import Foundation
import XCTest

extension XCUIApplication {
	
	func takeScreenshot(name: String) {
				
		let baseDirectory = ProcessInfo.processInfo.environment["DEBUG_DIR"]!
		do {
			
			let screenshot = self.screenshot().image
			let url = URL(fileURLWithPath: "\(baseDirectory)/\(name).png")
			try screenshot.pngData()?.write(to: url)
		} catch {
			XCTFail("\(error)")
			print(error)
		}
	}
}
