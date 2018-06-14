//
//  ProductCellTests.swift
//  code-demoTests
//
//  Created by Tancrède Chazallet on 14/06/2018.
//  Copyright © 2018 BitBuildr. All rights reserved.
//

import XCTest

class ProductCellTests: XCTestCase {
	
	var mockedViewModel: ProductCellModelForTesting
	var sut: ProductCell!
    
    override func setUp() {
        super.setUp()
		
		mockedViewModel = ProductCellModelForTesting()
		sut = ProductCell()
    }
	
	func test_titleLabel() {
		mockedViewModel.title = "asufh uhsiufhuisdh"
		sut.viewModel = mockedViewModel
		
		XCTAssertEqual(sut.titleLabel.text, "asufh uhsiufhuisdh")
	}
	
	func test_subtitleLabel() {
		mockedViewModel.subtitle = "£22.87"
		sut.viewModel = mockedViewModel
		
		XCTAssertEqual(sut.subtitleLabel.text, "£22.87")
	}
	
	func test_imageView() {
		mockedViewModel.image = #imageLiteral(resourceName: "test-image")
		sut.viewModel = mockedViewModel

		XCTAssertEqual(sut.imageView.image, #imageLiteral(resourceName: "test-image"))
	}
}

extension ProductCellTests {
	class ProductCellModelForTesting: ProductCellModel {
		var title: String = ""
		var image: UIImage? = nil
		var subtitle: String = ""
	}
}
