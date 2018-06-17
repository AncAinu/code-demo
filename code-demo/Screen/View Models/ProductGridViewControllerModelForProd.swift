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
	
	let productCellModels = Dynamic<[ProductCellModel]>([])
	
	// MARK: INIT
	init(dataService: DataService, imageService: ImageService) {
		self.dataService = dataService
		self.imageService = imageService
		
		// Bindings
		dataService.products.bindAndFire(self) { [weak self] value in
			guard let `self` = self else { return }
			
			self.productCellModels.value = value.map {
				ProductCellModelForProd(product: $0, imageService: self.imageService)
			}
		}
	}
	
	// MARK: METHODS
	func refresh() {
		dataService.reloadProducts()
	}
}
