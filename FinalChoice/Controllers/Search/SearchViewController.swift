//
//  SearchViewController.swift
//  FinalChoice
//
//  Created by 서충원 on 6/16/24.
//

import UIKit

class SearchViewController: UIViewController {
    
    private var customView = SearchView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = customView
        navigationItem.title = NavigationTitleNames.main
        let item = UIBarButtonItem(title: "유저네임")
        item.isEnabled = false
        navigationItem.leftBarButtonItem = item
        
        customView.searchBar.delegate = self
    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.text else { return }
        
        let vc = SearchResultViewController(text: text)
        self.removeBackButtonTitle()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
