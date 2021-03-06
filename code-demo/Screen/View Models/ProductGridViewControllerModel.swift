//
//  ProductGridViewControllerModel.swift
//  code-demo
//
//  Created by Tancrède Chazallet on 14/06/2018.
//  Copyright © 2018 BitBuildr. All rights reserved.
//

import Foundation

protocol ProductGridViewControllerModel: AnyObject {
	var productCellModels: Dynamic<[ProductCellModel]> { get }
	
	func refresh()
}
