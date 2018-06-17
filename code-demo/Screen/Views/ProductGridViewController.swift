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
		flowLayout.itemSize = CGSize(width: UIScreen.main.bounds.width / 2, height: UIScreen.main.bounds.width / 2)
		flowLayout.minimumInteritemSpacing = 0
		flowLayout.minimumLineSpacing = 0
		
		super.init(collectionViewLayout: flowLayout)
		
		title = "Fridges"
		
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
		
		view.backgroundColor = .white
		collectionView?.backgroundColor = .white
		
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
