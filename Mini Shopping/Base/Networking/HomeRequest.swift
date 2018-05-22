//
//  HomeRequest.swift
//  Mini Shopping
//
//  Created by Everson Trindade on 21/05/18.
//  Copyright © 2018 Everson Trindade. All rights reserved.
//

import Foundation

class HomeRequest: Requestable {
    
    func request(completion: @escaping (_ result: Shopping?, _ error: CustomError?) -> Void){
        let urlComponents = URLComponents(string: BaseAPI().base)
        guard let url = urlComponents?.url else {
            completion(nil, CustomError())
            return
        }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error  in
            if let error = error {
                completion(nil, CustomError(error: error.localizedDescription as? Error))
                return
            }
            guard let dataFromService = data else {
                completion(nil, CustomError())
                return
            }
            guard let products = try? JSONDecoder().decode(Shopping.self, from: dataFromService) else {
                completion(nil, CustomError())
                return
            }
            completion(products, nil)
        }.resume()
    }

}
