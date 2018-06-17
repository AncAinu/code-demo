//
//  DataServiceTests.swift
//  code-demoTests
//
//  Created by Tancrède Chazallet on 17/06/2018.
//  Copyright © 2018 BitBuildr. All rights reserved.
//

import XCTest

class DataServiceTests: XCTestCase {
	
	var mockedApiService: ApiServiceForTesting!
	var sut: DataServiceForProd!
	
	override func setUp() {
		mockedApiService = ApiServiceForTesting()
		sut = DataServiceForProd(apiService: mockedApiService)
	}
	
	func test_requestProducts() {
		let expectation = XCTestExpectation(description: "test_requestProducts")
		
		sut.requestProducts { result in
			switch result {
			case .success(let products):
				XCTAssertEqual(products.count, 3)
				expectation.fulfill()
			case .failure(_):
				break
			}
		}
		
		wait(for: [expectation], timeout: 0)
	}
}

extension DataServiceTests {
	class ProductEntityForTesting: ProductEntity {
		var productId: String = ""
		var title: String = ""
		var imageUrl: URL = URL(string: "http://test.com")!
		var price: Float = 0
	}
	
	class ApiServiceForTesting: ApiService {
		func requestProducts(response: Response<[ProductEntity]>) {
			response(.success([ProductEntityForTesting(), ProductEntityForTesting(), ProductEntityForTesting()]))
		}
	}
}
