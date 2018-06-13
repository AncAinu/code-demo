//
//  ProductEntityTests.swift
//  code-demoTests
//
//  Created by Tancrède Chazallet on 13/06/2018.
//  Copyright © 2018 BitBuildr. All rights reserved.
//

import XCTest

class ProductEntityTests: XCTestCase {
	
	func test_decoding() {
		let json = """
{
	"productId": "102938",
	"price": {
		"now": "312.43"
	},
	"title": "Test product 12",
	"image": "http://www.testurl.com/path/image.jpg"
}
"""
		let jsonData = json.data(using: .utf8)!
		
		let sut = try? JSONDecoder().decode(ProductEntity.self, from: jsonData)
		XCTAssertEqual(sut?.productId, "102938")
		XCTAssertEqual(sut?.price, 312.43)
		XCTAssertEqual(sut?.title, "Test product 12")
		XCTAssertEqual(sut?.imageUrl.absoluteString, "http://www.testurl.com/path/image.jpg")
	}
	
}
