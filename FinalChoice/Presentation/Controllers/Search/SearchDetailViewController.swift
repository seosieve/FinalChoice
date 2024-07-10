//
//  SearchDetailViewController.swift
//  FinalChoice
//
//  Created by 서충원 on 6/17/24.
//

import UIKit

class SearchDetailViewController: UIViewController {

    private var customView = SearchDetailView()
    private var customModel = SearchDetailModel()
    
    private var item: Item
    
    init(item: Item) {
        self.item = item
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = customView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = item.titleString
        let likeImage = customModel.configureLikeImage(productId: item.productId)
        let likeButton = UIBarButtonItem(image: likeImage, style: .plain, target: self, action: #selector(likeButtonClicked))
        navigationItem.rightBarButtonItem = likeButton
        customView.configureWebView(link: item.link)
    }
    
    @objc func likeButtonClicked(_ sender: UIBarButtonItem) {
        let likeImage = customModel.changeLikeImage(item: item)
        navigationItem.rightBarButtonItem?.image = likeImage
    }
}
