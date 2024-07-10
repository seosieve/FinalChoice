//
//  BasketViewController.swift
//  FinalChoice
//
//  Created by 서충원 on 7/10/24.
//

import UIKit

class BasketViewController: UIViewController {
    
    private var customView = BasketView()
    private var customModel = BasketModel()
    
    override func loadView() {
        self.view = customView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = Names.NavigationTitleNames.basket
        customView.searchResultCollectionView.delegate = self
        customView.searchResultCollectionView.dataSource = self
    }
}

//MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension BasketViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return customModel.result.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let basket = customModel.result[indexPath.row]
        let identifier = SearchResultCollectionViewCell.identifier
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? SearchResultCollectionViewCell
        guard let cell else { return UICollectionViewCell() }
        
        cell.deleteButton.tag = indexPath.row
        cell.deleteButton.addTarget(self, action: #selector(deleteButtonClicked), for: .touchUpInside)
        cell.configureCell(basket: basket, image: customModel.loadImage(fileName: basket.productId))
        return cell
    }
    
    @objc func deleteButtonClicked(_ sender: UIButton) {
        customModel.deleteBasketAction(sender.tag)
        customView.searchResultCollectionView.reloadData()
    }
}
