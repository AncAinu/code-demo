//
//  ProductGridViewController.swift
//  code-demo
//
//  Created by Tancrède Chazallet on 14/06/2018.
//  Copyright © 2018 BitBuildr. All rights reserved.
//

import UIKit

class ProductGridViewController: UICollectionViewController {
	let viewModel: ProductGridViewControllerModel
	
	// MARK: INIT
	init(viewModel: ProductGridViewControllerModel) {
		self.viewModel = viewModel
		
		let flowLayout = UICollectionViewFlowLayout()
		
		super.init(collectionViewLayout: flowLayout)
		
		viewModel.productCellModels.bind(self) { [weak self] _ in
			self?.collectionView?.reloadData()
		}
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	// MARK: LAYOUT
	override func viewDidLoad() {
		super.viewDidLoad()
		
		collectionView?.register(ProductCell.self, forCellWithReuseIdentifier: ProductCell.identifier)
		
		viewModel.refresh()
	}
	
	override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return viewModel.productCellModels.value.count
	}
	
	override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cellViewModel = viewModel.productCellModels.value[indexPath.row]
		
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCell.identifier, for: indexPath) as! ProductCell
		cell.viewModel = cellViewModel
		return cell
	}
}
