//
//  HomeViewController.swift
//  Mini Shopping
//
//  Created by Everson Trindade on 21/05/18.
//  Copyright © 2018 Everson Trindade. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, HomeLoadContent {

    // MARK: IBOutlet
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: Properties
    lazy var viewModel: HomeViewModelPresentable = HomeViewModel(homeLoadContent: self)
    
    // MARK: ViewController life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        getProducts()
    }
    
    // MARK: Functions
    func getProducts() {
        showLoader()
        viewModel.getProducts()
    }
    
    func didLoadContent(error: String?) {
        dismissLoader()
        if let _ = error {
            showDefaultAlert(message: "Could not load products, try later.", completeBlock: nil)
        } else {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
}

// MARK: UICollectionViewDelegate/UICollectionViewDataSource
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return viewModel.numberOfSections()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItemsInSection()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeViewCell", for: indexPath) as? HomeViewCell else {
            return UICollectionViewCell()
        }
        cell.fillCell(dto: viewModel.getCellDTO(row: indexPath.row))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}
