//
//  Movie.swift
//  Course Materials
//
//  Created by Matt Beaney on 01/03/2023.
//

import Foundation

struct Movie: Codable {
	let id: Int
	let title: String
	let year: String
	let runTime: String?
	let director: String
	let actors: String
	let plot: String
	let posterUrl: String?
}
