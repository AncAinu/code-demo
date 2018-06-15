//
//  ProductEntity.swift
//  code-demo
//
//  Created by Tancrède Chazallet on 13/06/2018.
//  Copyright © 2018 BitBuildr. All rights reserved.
//

import Foundation

protocol ProductEntity: Codable {
	var productId: String { get }
	var title: String { get }
	var imageUrl: URL { get }
	var price: Float { get }
}

struct ProductEntityForProd: ProductEntity {
	struct Price: Codable {
		let now: String
	}
	
	enum CodingKeys: String, CodingKey {
		case productId
		case privatePrice = "price"
		case title
		case imageUrl = "image"
	}
	
	let productId: String
	
	private let privatePrice: Price
	var price: Float {
		return Float(privatePrice.now)!
	}
	
	let title: String
	
	var imageUrl: URL
}
