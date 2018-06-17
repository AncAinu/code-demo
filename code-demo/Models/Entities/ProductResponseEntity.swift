//
//  ProductResponseEntity.swift
//  code-demo
//
//  Created by Tancrède Chazallet on 13/06/2018.
//  Copyright © 2018 BitBuildr. All rights reserved.
//

import Foundation

protocol ProductResponseEntity: Codable {
	var products: [ProductEntity] { get }
}

struct ProductResponseEntityForProd: ProductResponseEntity {
	enum CodingKeys: String, CodingKey {
		case privateProducts = "products"
	}
	
	private let privateProducts: [ProductEntityForProd]
	var products: [ProductEntity] {
		return privateProducts
	}
}
