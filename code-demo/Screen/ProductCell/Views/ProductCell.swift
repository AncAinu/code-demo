//
//  ProductCell.swift
//  code-demo
//
//  Created by Tancrède Chazallet on 14/06/2018.
//  Copyright © 2018 BitBuildr. All rights reserved.
//

import UIKit
import SnapKit

class ProductCell: UICollectionViewCell {
	static let identifier = #function
	
	var viewModel: ProductCellModel? {
		didSet {
			guard let viewModel = viewModel else { return }
			
			imageView.image = viewModel.image
			titleLabel.text = viewModel.title
			subtitleLabel.text = viewModel.subtitle
		}
	}
	
	let imageView = UIImageView()
	let titleLabel = UILabel()
	let subtitleLabel = UILabel()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		imageView.contentMode = .scaleAspectFit
		contentView.addSubview(imageView)
		
		contentView.addSubview(titleLabel)
		
		contentView.addSubview(subtitleLabel)
		
		// Auto Layout
		imageView.snp.makeConstraints {
			$0.left.right.top.equalToSuperview().inset(10)
			$0.width.equalTo(imageView.snp.height)
		}
		
		titleLabel.snp.makeConstraints {
			$0.left.right.equalToSuperview().inset(10)
			$0.top.equalTo(imageView.snp.bottom).offset(10)
		}
		
		subtitleLabel.snp.makeConstraints {
			$0.left.right.equalToSuperview().inset(10)
			$0.top.equalTo(titleLabel.snp.bottom).offset(10)
			$0.bottom.equalToSuperview().offset(-10)
		}
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
