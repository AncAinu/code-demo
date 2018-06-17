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
	
	let products = Dynamic<[ProductEntity]>([])
	
	// MARK: INIT
	init(apiService: ApiService) {
		self.apiService = apiService
	}
	
	// MARK: METHODS
	func reloadProducts() {
		apiService.requestProducts { [weak self] result in
			guard let `self` = self else { return }
			
			switch result {
			case .success(let products):
				self.products.value = products
			case .failure(_):
				break // Do nothing
			}
		}
	}
}
