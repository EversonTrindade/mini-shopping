//
//  Base.swift
//  Mini Shopping
//
//  Created by Everson Trindade on 21/05/18.
//  Copyright © 2018 Everson Trindade. All rights reserved.
//

import Foundation

protocol Requestable: class {
    associatedtype DataType
    func request(completion: @escaping (_ result: DataType?, _ error: CustomError?) -> Void)
}

struct BaseAPI {
    var base: String {
        return "https://api.myjson.com/bins/yswbm"
    }
}
