//
//  ProductGridViewControllerModelForProd.swift
//  code-demo
//
//  Created by Tancrède Chazallet on 14/06/2018.
//  Copyright © 2018 BitBuildr. All rights reserved.
//

import Foundation

class ProductGridViewControllerModelForProd: ProductGridViewControllerModel {
	private let dataService: DataService
	private let imageService: ImageService
	
	private(set) var productCellModels: [ProductCellModel] = []
	
	init(dataService: DataService, imageService: ImageService) {
		self.dataService = dataService
		self.imageService = imageService
	}
	
	func refresh() {
		dataService.requestProducts { [weak self] result in
			guard let `self` = self else { return }
			
			switch result {
			case .success(let products):
				self.productCellModels = products.map {
					ProductCellModelForProd(product: $0, imageService: self.imageService)
				}
			case .failure(_):
				break // Do nothing
			}
		}
	}
}
