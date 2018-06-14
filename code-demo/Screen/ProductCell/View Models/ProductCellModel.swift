//
//  ProductCellModel.swift
//  code-demo
//
//  Created by Tancrède Chazallet on 14/06/2018.
//  Copyright © 2018 BitBuildr. All rights reserved.
//

import UIKit

protocol ProductCellModel: AnyObject {
	var image: UIImage? { get }
	var title: String { get }
	var subtitle: String { get }
}
