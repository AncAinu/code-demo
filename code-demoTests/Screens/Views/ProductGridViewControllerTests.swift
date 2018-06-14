//
//  ProductGridViewControllerTests.swift
//  code-demoTests
//
//  Created by Tancrède Chazallet on 13/06/2018.
//  Copyright © 2018 BitBuildr. All rights reserved.
//

import XCTest

class ProductGridViewControllerTests: XCTestCase {
	var mockedViewModel: ProductGridViewControllerModelForTesting!
	var sut: ProductGridViewController!
	
	override func setUp() {
		mockedViewModel = ProductGridViewControllerModelForTesting()
		sut = ProductGridViewController(viewModel: mockedViewModel)
	}
	
	func test_no_products() {
		mockedViewModel.productCellModels = []
		XCTAssertEqual(sut.collectionView.numberOfCells.count, 0)
	}
	
	func test_3_products() {
		mockedViewModel.productCellModels = [ProductCellModelForTesting(), ProductCellModelForTesting(), ProductCellModelForTesting()]
		XCTAssertEqual(sut.collectionView.numberOfCells.count, 3)
	}
}

extension ProductGridViewControllerTests {
	class ProductGridViewControllerModelForTesting: ProductGridViewControllerModel {
		var productCellModels: [ProductCellModel] = []
	}
	
	class ProductCellModelForTesting: ProductCellModel {
		
	}
}
