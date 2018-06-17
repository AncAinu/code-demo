//
//  ProductCellModelForProd.swift
//  code-demo
//
//  Created by Tancrède Chazallet on 15/06/2018.
//  Copyright © 2018 BitBuildr. All rights reserved.
//

import UIKit

class ProductCellModelForProd: ProductCellModel {
	let image = Dynamic<UIImage?>(nil)
	let title = Dynamic<String>("")
	let subtitle = Dynamic<String>("")
	
	init(product: ProductEntity, imageService: ImageService) {
		title.value = product.title
		subtitle.value = "£\(product.price)"
		
		imageService.imageForUrl(product.imageUrl) { [weak self] result in
			switch result {
			case .success(let image):
				self?.image.value = image
			case .failure(_):
				break // Do nothing
			}
		}
	}
}
