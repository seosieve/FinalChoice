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
//        let item = customModel.itemResult.items[indexPath.item]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchResultCollectionViewCell.identifier, for: indexPath) as! SearchResultCollectionViewCell
//        cell.configureCell(item: item)
//        cell.highlightText(text: text)
        return cell
    }
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let item = customModel.itemResult.items[indexPath.item]
//        let link = item.link
//        let productId = item.productId
//        let titleString = item.titleString
//        let vc = SearchDetailViewController(link: link, productId: productId, titleString: titleString)
//        self.removeBackButtonTitle()
//        self.navigationController?.pushViewController(vc, animated: true)
//    }
}
