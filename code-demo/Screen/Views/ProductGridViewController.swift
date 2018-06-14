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
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	// MARK: LAYOUT
	override func viewDidLoad() {
		super.viewDidLoad()
		
		collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
	}
	
	override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return viewModel.productCellModels.count
	}
	
	override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
		cell.backgroundColor = .red
		return cell
	}
}
