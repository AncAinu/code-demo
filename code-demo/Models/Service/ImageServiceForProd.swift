//
//  ImageServiceForProd.swift
//  code-demo
//
//  Created by Tancrède Chazallet on 15/06/2018.
//  Copyright © 2018 BitBuildr. All rights reserved.
//

import UIKit

class ImageServiceForProd: ImageService {
	func imageForUrl(_ url: URL, response: @escaping (ImageServiceResponseType) -> Void) {
		DispatchQueue.global().async {
			guard let imageData = try? Data(contentsOf: url), let image = UIImage(data: imageData) else {
				DispatchQueue.main.async {
					response(.failure(nil))
				}
				return
			}
			
			DispatchQueue.main.async {
				response(.success(image))
			}
		}
	}
}
