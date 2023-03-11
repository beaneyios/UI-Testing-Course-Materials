//
//  BaseUrlManager.swift
//  Course Materials
//
//  Created by Matt Beaney on 01/03/2023.
//

import UIKit

struct BaseUrlManager {
	
	static var baseUrl: String {
		
		if UIApplication.shared.isRunningUITests {
			return "http://localhost:3000"
		} else {
			return "https://beaneyios.github.io"
		}
	}
}
