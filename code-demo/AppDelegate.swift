//
//  AppDelegate.swift
//  code-demo
//
//  Created by Tancrède Chazallet on 13/06/2018.
//  Copyright © 2018 BitBuildr. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
		
		window = UIWindow(frame: UIScreen.main.bounds)
		
		let apiService = ApiServiceForProd()
		let dataService = DataServiceForProd(apiService: apiService)
		let imageService = ImageServiceForProd()
		
		let productGridViewControllerModel = ProductGridViewControllerModelForProd(dataService: dataService, imageService: imageService)
		let productGridViewController = ProductGridViewController(viewModel: productGridViewControllerModel)
		let navigationController = UINavigationController(rootViewController: productGridViewController)
		
		window?.rootViewController = navigationController
		window?.makeKeyAndVisible()
		
		return true
	}

}

