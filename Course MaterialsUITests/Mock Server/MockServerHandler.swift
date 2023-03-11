//
//  MockServerHandler.swift
//  Course MaterialsUITests
//
//  Created by Matt Beaney on 11/03/2023.
//

import Foundation

import Foundation

class MockServerHandler {
	
	static func pushBody(
		fixtureName: String,
		path: String
	) async throws {
		
		let jsonData = try self.jsonBody(named: fixtureName)
		
		let url = URL(string: "http://localhost:3000/upload")!
		var request = URLRequest(url: url)
		request.addValue("application/json", forHTTPHeaderField: "Content-Type")
		request.addValue("http://localhost.com:3000/\(path)", forHTTPHeaderField: "url-key")
		request.httpMethod = "POST"
		request.httpBody = jsonData
		
		let session = URLSession.shared
		_ = try await session.data(for: request)
	}
	
	static func pushWebsocket(fixtureName: String) async throws {
		
		let jsonData = try self.jsonBody(named: fixtureName)
		
		let url = URL(string: "http://localhost:3000/websocket")!
		var request = URLRequest(url: url)
		request.addValue("application/json", forHTTPHeaderField: "Content-Type")
		request.httpMethod = "PUT"
		request.httpBody = jsonData
		
		let session = URLSession.shared
		_ = try await session.data(for: request)
	}
	
	static func cleanUp() async throws {
		let url = URL(string: "http://localhost:3000/delete-all")!
		var request = URLRequest(url: url)
		request.httpMethod = "DELETE"
		let session = URLSession.shared
		_ = try await session.data(for: request)
	}
	
	private static func jsonBody(named name: String) throws -> Data {
		
		let bundle = Bundle(for: Self.self)
		let fileUrl = bundle.url(forResource: name, withExtension: "json")!
		let data = try! Data(contentsOf: fileUrl)
		
		let jsonObject = try! JSONSerialization.jsonObject(with: data)
		return try! JSONSerialization.data(withJSONObject: jsonObject)
	}
}
