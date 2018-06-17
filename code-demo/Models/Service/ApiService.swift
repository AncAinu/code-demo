//
//  ApiService.swift
//  code-demo
//
//  Created by Tancrède Chazallet on 17/06/2018.
//  Copyright © 2018 BitBuildr. All rights reserved.
//

import Foundation

protocol ApiService {
	func requestProducts(response: @escaping Response<[ProductEntity]>)
}
