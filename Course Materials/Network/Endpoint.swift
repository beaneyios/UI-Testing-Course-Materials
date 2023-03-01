//
//  Endpoint.swift
//  Course Materials
//
//  Created by Matt Beaney on 01/03/2023.
//

import Foundation

enum Endpoint {
	
	case movieList
	
	var path: String {
		
		switch self {
		case .movieList:
			return "/movies.json"
		}
	}
}
