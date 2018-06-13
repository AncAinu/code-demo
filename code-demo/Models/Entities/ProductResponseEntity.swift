//
//  ProductResponseEntity.swift
//  code-demo
//
//  Created by Tancrède Chazallet on 13/06/2018.
//  Copyright © 2018 BitBuildr. All rights reserved.
//

import Foundation

struct ProductResponseEntity: Codable {
	let products: [ProductEntity]
}
