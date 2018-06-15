//
//  ProductsResponseEntityTests.swift
//  code-demoTests
//
//  Created by Tancrède Chazallet on 13/06/2018.
//  Copyright © 2018 BitBuildr. All rights reserved.
//

import XCTest

class ProductsResponseEntityTests: XCTestCase {
	func test_decoding_no_product() {
		let json = """
{
	"products": []
}
"""
		let jsonData = json.data(using: .utf8)!
		
		let sut = try? JSONDecoder().decode(ProductResponseEntityForProd.self, from: jsonData)
		XCTAssertEqual(sut?.products.count, 0)
	}
	
	func test_decoding_1_product() {
		let json = """
{
	"products": [
		{
			"productId": "102938",
			"price": {
				"now": "312.43"
			},
			"title": "Test product 12",
			"image": "http://www.testurl.com/path/image.jpg"
		}
	]
}
"""
		let jsonData = json.data(using: .utf8)!
		
		let sut = try? JSONDecoder().decode(ProductResponseEntityForProd.self, from: jsonData)
		XCTAssertEqual(sut?.products.count, 1)
		XCTAssertEqual(sut?.products[0].productId, "102938")
		XCTAssertEqual(sut?.products[0].price, 312.43)
		XCTAssertEqual(sut?.products[0].title, "Test product 12")
		XCTAssertEqual(sut?.products[0].imageUrl.absoluteString, "http://www.testurl.com/path/image.jpg")
	}
	
	func test_decoding_2_products() {
		let json = """
{
	"products": [
		{
			"productId": "102938",
			"price": {
				"now": "312.43"
			},
			"title": "Test product 12",
			"image": "http://www.testurl.com/path/image.jpg"
		},
		{
			"productId": "32425",
			"price": {
				"now": "43.11"
			},
			"title": "Test product 11",
			"image": "http://www.testurl.com/path/image2.jpg"
		}
	]
}
"""
		let jsonData = json.data(using: .utf8)!
		
		let sut = try? JSONDecoder().decode(ProductResponseEntityForProd.self, from: jsonData)
		XCTAssertEqual(sut?.products.count, 2)
		
		XCTAssertEqual(sut?.products[0].productId, "102938")
		XCTAssertEqual(sut?.products[0].price, 312.43)
		XCTAssertEqual(sut?.products[0].title, "Test product 12")
		XCTAssertEqual(sut?.products[0].imageUrl.absoluteString, "http://www.testurl.com/path/image.jpg")
		
		XCTAssertEqual(sut?.products[1].productId, "32425")
		XCTAssertEqual(sut?.products[1].price, 43.11)
		XCTAssertEqual(sut?.products[1].title, "Test product 11")
		XCTAssertEqual(sut?.products[1].imageUrl.absoluteString, "http://www.testurl.com/path/image2.jpg")
	}
}
