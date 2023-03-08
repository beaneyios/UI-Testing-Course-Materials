//
//  XCUIApplication+ScreenshotHelpers.swift
//  Course MaterialsUITests
//
//  Created by Matt Beaney on 08/03/2023.
//

import Foundation
import UIKit

extension UIImage {

	var removingStatusBar: UIImage? {
		
		guard let cgImage = cgImage else {
			return nil
		}

		let yOffset = 88 * scale // status bar height on standard devices (not iPhoneX)
		let rect = CGRect(
			x: 0,
			y: Int(yOffset),
			width: cgImage.width,
			height: cgImage.height - Int(yOffset) - 34
		)

		if let croppedCGImage = cgImage.cropping(to: rect) {
			return UIImage(cgImage: croppedCGImage, scale: scale, orientation: imageOrientation)
		}

		return nil
	}
}
