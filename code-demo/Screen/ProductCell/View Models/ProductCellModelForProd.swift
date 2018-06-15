//
//  ProductCellModelForProd.swift
//  code-demo
//
//  Created by Tancrède Chazallet on 15/06/2018.
//  Copyright © 2018 BitBuildr. All rights reserved.
//

import UIKit

class ProductCellModelForProd: ProductCellModel {
	var image: UIImage? = nil
	var title: String
	var subtitle: String
	
	init(product: ProductEntity, imageService: ImageService) {
		title = product.title
		subtitle = "£\(product.price)"
		
		imageService.imageForUrl(product.imageUrl) { [weak self] result in
			switch result {
			case .success(let image):
				self?.image = image
			case .failure(_):
				break // Do nothing
			}
		}
	}
}
