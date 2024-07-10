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
    
    init(text: String) {
        super.init(nibName: nil, bundle: nil)
        self.text = text
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = customView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.setUpBarAppearance(isSearch: true)
        navigationItem.title = text
        customView.searchResultCollectionView.delegate = self
        customView.searchResultCollectionView.dataSource = self
        customView.searchResultCollectionView.prefetchDataSource = self
        customView.delegate = self
        customModel.itemResultUpdated = { itemResult in
            self.customView.makeInitalView(itemResult)
        }
        loadItemResult(sort: customModel.sort, start: 1)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        customView.searchResultCollectionView.reloadData()
    }
    
    private func loadItemResult(sort: Names.ButtonNames, start: Int) {
        customView.makeToastActivity(.center)
        customModel.shoppingRequest(text: text, sort: sort, start: start) { itemResult in
            self.customView.hideToastActivity()
        }
    }
}

//MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension SearchResultViewController: UICollectionViewDelegate, UICollectionViewDataSource, SearchResultCellDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return customModel.itemResult.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = customModel.itemResult.items[indexPath.item]
        let identifier = SearchResultCollectionViewCell.identifier
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? SearchResultCollectionViewCell
        guard let cell else { return UICollectionViewCell() }
        
        cell.delegate = self
        cell.configureCell(item: item)
        cell.highlightText(text: text)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = customModel.itemResult.items[indexPath.item]
        let link = item.link
        let productId = item.productId
        let titleString = item.titleString
        let vc = SearchDetailViewController(link: link, productId: productId, titleString: titleString)
        self.removeBackButtonTitle()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func likeButtonAction(_ cell: SearchResultCollectionViewCell, _ item: Item) {
        ///UserDefaults
        cell.state == .selected ? UserDefaultManager.addLike(cell.item.productId) : UserDefaultManager.removeLike(cell.item.productId)
        ///Realm
        cell.state == .selected ? customModel.addBasketAction(item) : customModel.deleteBasketAction(item)
        ///FileManager
        cell.state == .selected ? customModel.addImageAction(item) : customModel.deleteImageAction(item)
    }
}

//MARK: - UICollectionViewDataSourcePrefetching
extension SearchResultViewController: UICollectionViewDataSourcePrefetching {
    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
        for indexPath in indexPaths {
            customModel.paginationAction(indexPath: indexPath) { sort, start in
                self.loadItemResult(sort: sort, start: start)
            }
        }
    }
}

//MARK: - SearchResultDelegate
extension SearchResultViewController: SearchResultDelegate {
    func sortButtonAction(_ name: Names.ButtonNames) {
        customView.reloadSortButttons(name: name)
        customModel.sort = name
        loadItemResult(sort: customModel.sort, start: 1)
        customView.searchResultCollectionView.scrollToItem(at: [0,0], at: .top, animated: true)
    }
}
