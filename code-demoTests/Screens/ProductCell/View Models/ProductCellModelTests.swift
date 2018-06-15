//
//  ProductCellModelTests.swift
//  code-demoTests
//
//  Created by Tancrède Chazallet on 15/06/2018.
//  Copyright © 2018 BitBuildr. All rights reserved.
//

import XCTest

class ProductCellModelTests: XCTestCase {
	
	var mockedImageService: ImageServiceForTesting!
	var mockedProductEntity: ProductEntityForTesting!
	
	override func setUp() {
		mockedImageService = ImageServiceForTesting()
		mockedProductEntity = ProductEntityForTesting()
	}
	
	func test_title() {
		mockedProductEntity.title = "aouishdfjoijvcx"
		let sut = ProductCellModelForProd(product: mockedProductEntity, imageService: mockedImageService)
		
		XCTAssertEqual(sut.title, "aouishdfjoijvcx")
	}
	
	func test_subtitle() {
		mockedProductEntity.price = 2.49
		let sut = ProductCellModelForProd(product: mockedProductEntity, imageService: mockedImageService)
		
		XCTAssertEqual(sut.title, "£2.49")
	}
	
	func test_image() {
		// We actually make sure that the viewModel does connect to the image service properly
		mockedProductEntity.imageUrl = URL(string: "http://test.com")!
		let sut = ProductCellModelForProd(product: mockedProductEntity, imageService: mockedImageService)
		XCTAssertEqual(sut.image, UIImage.fromBundle(#imageLiteral(resourceName: "test-image")))
	}
}

extension ProductCellModelTests {
	class ProductEntityForTesting: ProductEntity {
		var productId: String = ""
		var title: String = ""
		var imageUrl: URL = URL(string: "http://test.com")!
		var price: Float = 0
	}
	
	class ImageServiceForTesting: ImageService {
		func imageForUrl(_ url: URL, response: ImageServiceResponse) {
			return ImageServiceResponse.success(UIImage.fromBundle(#imageLiteral(resourceName: "test-image")))
		}
	}
}
