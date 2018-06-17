//
//  DataServiceForProd.swift
//  code-demo
//
//  Created by Tancrède Chazallet on 17/06/2018.
//  Copyright © 2018 BitBuildr. All rights reserved.
//

import Foundation

class DataServiceForProd: DataService {
	private let apiService: ApiService
	
	init(apiService: ApiService) {
		self.apiService = apiService
	}
	
	func requestProducts(response: @escaping (Result<[ProductEntity]>) -> Void) {
		apiService.requestProducts(response: response)
	}
}
