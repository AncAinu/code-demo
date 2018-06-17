//
//  ImageExtension.swift
//  code-demoTests
//
//  Created by Tancrède Chazallet on 14/06/2018.
//  Copyright © 2018 BitBuildr. All rights reserved.
//

import UIKit

class WrappedBundleImage: _ExpressibleByImageLiteral {
	let image: UIImage
	
	required init(imageLiteralResourceName name: String) {
		let bundle = Bundle(for: WrappedBundleImage.self)
		image = UIImage(named: name, in: bundle, compatibleWith: nil)!
	}
}

extension UIImage {
	static func fromBundle(_ wrappedImage: WrappedBundleImage) -> UIImage {
		return wrappedImage.image
	}
}
