//
//  ProductGridViewControllerModelTests.swift
//  code-demoTests
//
//  Created by Tancrède Chazallet on 15/06/2018.
//  Copyright © 2018 BitBuildr. All rights reserved.
//

import XCTest

class ProductGridViewControllerModelTests: XCTestCase {
	
	var mockedDataService: DataServiceForTesting!
	var sut: ProductGridViewControllerModelForProd!
    
    override func setUp() {
        super.setUp()
		
		mockedDataService = DataServiceForTesting()
		sut = ProductGridViewControllerModelForProd(dataService: DataService)
    }
	
	func test_refresh() {
		XCTAssertEqual(sut.productCellModels.count, 0)
		sut.refresh()
		XCTAssertEqual(sut.productCellModels.count, 3)
	}
}

extension ProductGridViewControllerModelTests {
	class ProductEntityForTesting: ProductEntity {
		var productId: String = ""
		var title: String = ""
		var imageUrl: URL = URL(string: "http://test.com")!
		var price: Float = 0
	}
	
	class DataServiceForTesting: DataService {
		func requestProducts(response: @escaping (Result<[ProductEntity]>)) {
			response(.success([ProductEntityForTesting(), ProductEntityForTesting(), ProductEntityForTesting()]))
		}
	}
}
