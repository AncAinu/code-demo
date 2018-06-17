//
//  ImageService.swift
//  code-demo
//
//  Created by Tancrède Chazallet on 15/06/2018.
//  Copyright © 2018 BitBuildr. All rights reserved.
//

import UIKit

typealias ImageServiceResponse = (ImageServiceResponseType) -> Void
enum ImageServiceResponseType {
	case success(UIImage)
	case failure(Error?)
}

protocol ImageService: AnyObject {
	func imageForUrl(_ url: URL, response: @escaping ImageServiceResponse)
}
