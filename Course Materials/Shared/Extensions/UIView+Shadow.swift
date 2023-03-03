//
//  UIView+Shadow.swift
//  Course Materials
//
//  Created by Matt Beaney on 03/03/2023.
//

import UIKit

extension UIView {
	
	func addShadow() {
		self.layer.cornerRadius = 12.0
		self.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
		self.layer.shadowColor = UIColor.black.cgColor
		self.layer.shadowRadius = 1.0
		self.layer.shadowOpacity = 0.7
		self.clipsToBounds = false
	}
}
