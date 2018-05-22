//
//  HomeViewCell.swift
//  Mini Shopping
//
//  Created by Everson Trindade on 22/05/18.
//  Copyright © 2018 Everson Trindade. All rights reserved.
//

import UIKit

struct HomeCellDTO {
    var prodImage = ""
    var name = ""
    var price = 0
    var size = ""
    var discount = 0
    var userImage = ""
    var likes = 0
}

class HomeViewCell: UICollectionViewCell {
    
    @IBOutlet weak var prodimage: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var discountLbl: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var likesImage: UIImageView!
    @IBOutlet weak var likesLbl: UILabel!
    
    func fillCell(dto: HomeCellDTO) {
        nameLbl.text = dto.name
        priceLbl.text = "R$ \(dto.price) - tam \(dto.size)"
        discountLbl.text = "-\(dto.discount)%"
        likesLbl.text = "\(dto.likes)"
    }
}
