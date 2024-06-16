//
//  SearchResultViewController.swift
//  FinalChoice
//
//  Created by 서충원 on 6/16/24.
//

import UIKit
import Toast

class SearchResultViewController: UIViewController {

    private var customView = SearchResultView()
    private var customModel = SearchResultModel()
    
    private var text: String!
    private var sort = ButtonNames.accuracy
    private var itemResult = ItemResult(total: 0, items: [Item]()) {
        didSet { customView.reloadViewByResult() }
    }
    
    init(text: String) {
        super.init(nibName: nil, bundle: nil)
        self.text = text
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.setUpBarAppearance(isSearch: true)
        self.view = customView
        navigationItem.title = text
        customView.searchResultCollectionView.delegate = self
        customView.searchResultCollectionView.dataSource = self
        customView.delegate = self
        customView.makeToastActivity(.center)
        customModel.shoppingRequest(text: "김밥") { itemResult in
            self.itemResult = itemResult
            self.customView.hideToastActivity()
        }
    }
}

//MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension SearchResultViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemResult.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = itemResult.items[indexPath.item]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchResultCollectionViewCell.identifier, for: indexPath) as! SearchResultCollectionViewCell
        cell.configureCell(item: item)
        return cell
    }
}

//MARK: - SearchResultDelegate
extension SearchResultViewController: SearchResultDelegate {
    func sortButtonAction(_ name: ButtonNames) {
        customView.reloadSortButttons(name: name)
        sort = name
    }
}
