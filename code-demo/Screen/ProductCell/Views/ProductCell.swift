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
			
			viewModel.image.bindAndFire(self) { [weak self] value in
				self?.imageView.image = value
			}
			viewModel.title.bindAndFire(self) { [weak self] value in
				self?.titleLabel.text = value
			}
			viewModel.subtitle.bindAndFire(self) { [weak self] value in
				self?.subtitleLabel.text = value
			}
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
	
	override func prepareForReuse() {
		viewModel?.image.unbind(listener: self)
		viewModel?.title.unbind(listener: self)
		viewModel?.subtitle.unbind(listener: self)
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
