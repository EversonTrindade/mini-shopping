//
//  Array+Extension.swift
//  Mini Shopping
//
//  Created by Everson Trindade on 22/05/18.
//  Copyright © 2018 Everson Trindade. All rights reserved.
//

import Foundation

extension Array {
    func object(index: Int) -> Element? {
        if index >= 0 && index < self.count {
            return self[index]
        }
        return nil
    }
}
