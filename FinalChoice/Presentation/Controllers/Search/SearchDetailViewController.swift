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
    
    private var link: String!
    private var productId: String!
    private var titleString: String!
    
    init(link: String, productId: String, titleString: String) {
        super.init(nibName: nil, bundle: nil)
        self.link = link
        self.productId = productId
        self.titleString = titleString
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = customView
        navigationItem.title = titleString
        let likeImage = customModel.configureLikeImage(productId: productId)
        let likeButton = UIBarButtonItem(image: likeImage, style: .plain, target: self, action: #selector(likeButtonClicked))
        navigationItem.rightBarButtonItem = likeButton
        customView.configureWebView(link: link)
        
        print(link)
    }
    
    @objc func likeButtonClicked(_ sender: UIBarButtonItem) {
        let likeImage = customModel.changeLikeImage(productId: productId)
        navigationItem.rightBarButtonItem?.image = likeImage
    }
}
