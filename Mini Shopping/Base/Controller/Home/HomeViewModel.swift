//
//  HomeViewModel.swift
//  Mini Shopping
//
//  Created by Everson Trindade on 21/05/18.
//  Copyright © 2018 Everson Trindade. All rights reserved.
//

import Foundation

protocol HomeLoadContent: class {
    func didLoadContent(error: String?)
}

protocol HomeViewModelPresentable: class {
    func getProducts()
    func numberOfSections() -> Int
    func numberOfItemsInSection() -> Int
    func getCellDTO(row: Int) -> HomeCellDTO
}

class HomeViewModel: HomeViewModelPresentable {
    
    // MARK: Properties
    private weak var homeLoadContent: HomeLoadContent?
    var interactor: HomeInteractorPresentable?
    var products = [Product]()
    
    // MARK: Init
    init(homeLoadContent: HomeLoadContent?, interactor: HomeInteractorPresentable? = HomeInteractor()) {
        self.homeLoadContent = homeLoadContent
        self.interactor = interactor
    }
    
    // MARK: Functions
    func getProducts() {
        interactor?.homeProducts(completion: { results, error in
            guard let products = results else {
                self.homeLoadContent?.didLoadContent(error: error)
                return
            }
            self.products = products
            self.homeLoadContent?.didLoadContent(error: nil)
        })
    }
    
    // MARK: Collection DTO
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfItemsInSection() -> Int {
        return products.count
    }
    
    func getCellDTO(row: Int) -> HomeCellDTO {
        guard let dto = products.object(index: row) else {
            return HomeCellDTO()
        }
        return HomeCellDTO(prodImage: dto.default_photo?.cloudinary_public_id ?? "",
                           name: dto.title ?? "",
                           price: dto.price ?? 0,
                           size: dto.size ?? "",
                           discount: dto.discount_percentage ?? 0,
                           userImage: dto.user?.avatar?.cloudinary_public_id ?? "",
                           likes: dto.likes_count ?? 0)
    }
}
