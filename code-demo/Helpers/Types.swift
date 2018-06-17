//
//  Types.swift
//  code-demo
//
//  Created by Tancrède Chazallet on 17/06/2018.
//  Copyright © 2018 BitBuildr. All rights reserved.
//

import Foundation

typealias Response<T> = (Result<T>) -> Void

enum Result<T> {
	case success(T)
	case failure(Error?)
}
