//
//  HomeInteractor.swift
//  Mini Shopping
//
//  Created by Everson Trindade on 21/05/18.
//  Copyright © 2018 Everson Trindade. All rights reserved.
//

import Foundation

protocol HomeInteractorPresentable: class {
    func homeProducts(completion: @escaping (_ object: [Product]?, _ error: String?) -> ())
}

class HomeInteractor: HomeInteractorPresentable {
    func homeProducts(completion: @escaping (_ object: [Product]?, _ error: String?) -> ()){
        HomeRequest().request { result, error in
            completion(result?.products ?? nil, error?.message)
        }
    }
}
