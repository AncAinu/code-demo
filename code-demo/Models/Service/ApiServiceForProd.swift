//
//  ApiServiceForProd.swift
//  code-demo
//
//  Created by Tancrède Chazallet on 17/06/2018.
//  Copyright © 2018 BitBuildr. All rights reserved.
//

import Foundation
import Alamofire

class ApiServiceForProd: ApiService {
	func requestProducts(response: @escaping Response<[ProductEntity]>) {
		Alamofire.request("https://api.johnlewis.com/v1/products/search?q=dishwasher&key=Wu1Xqn3vNrd1p7hqkvB6hEu0G9OrsYGb&pageSize=20").responseJSON { apiResponse in
			
			guard let jsonData = apiResponse.data else {
				response(.failure(nil)) // Do not treat errors yet
				return
			}
			
			guard let productResponse = try? JSONDecoder().decode(ProductResponseEntityForProd.self, from: jsonData) else {
				response(.failure(nil)) // Do not treat errors yet
				return
			}
			
			response(.success(productResponse.products))
		}
	}
}
