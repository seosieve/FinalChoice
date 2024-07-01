//
//  SearchViewController.swift
//  FinalChoice
//
//  Created by 서충원 on 6/16/24.
//

import UIKit

class SearchViewController: UIViewController {
    
    private var customView = SearchView()
    private var customModel = SearchModel()

    init(textArr: [String]) {
        super.init(nibName: nil, bundle: nil)
        customModel.searchedTextArr = textArr
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = customView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = Names.NavigationTitleNames.main
        customView.delegate = self
        customView.searchedWordTableView.delegate = self
        customView.searchedWordTableView.dataSource = self
        customView.searchBar.delegate = self
        customModel.searchedTextUpdated = { count in
            self.customView.configureSearchView(count: count)
            self.customView.searchedWordTableView.reloadData()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        ///Change ZingRust Font Again
        self.navigationController?.navigationBar.setUpBarAppearance()
        customView.searchBar.text = ""
        customView.reloadNicknameLabel(text: customModel.setUserNickname())
        customModel.reloadSearchedText()
    }
}

//MARK: - UISearchBarDelegate
extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.text?.replacingOccurrences(of: " ", with: "") else { return }
        ///Empty Text Error Handling
        if text != "" {
            UserDefaultManager.addSearchedText(text: text)
            self.pushViewController(SearchResultViewController(text: text))
        }
    }
}

//MARK: - UITableViewDataSource
extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return customModel.searchedTextArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let word = customModel.searchedTextArr[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchedWordTableViewCell.identifier, for: indexPath) as! SearchedWordTableViewCell
        cell.configureCell(word: word)
        cell.removeButton.addTarget(self, action: #selector(removeButtonClicked), for: .touchUpInside)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let word = customModel.searchedTextArr[indexPath.row]
        UserDefaultManager.addSearchedText(text: word)
        self.pushViewController(SearchResultViewController(text: word))
    }
    
    @objc func removeButtonClicked(_ sender: UIButton) {
        guard let indexPath = customView.searchedWordTableView.getIndexPath(sender) else { return }
        customModel.removeSearchedText(index: indexPath.row)
    }
}

//MARK: - SearchDelegate
extension SearchViewController: SearchDelegate {
    func removeAllAction() {
        customModel.removeAllSearchedText()
    }
}
