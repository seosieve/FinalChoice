//
//  SearchView.swift
//  FinalChoice
//
//  Created by 서충원 on 6/16/24.
//

import UIKit

class SearchView: BaseView {
    
    weak var delegate: SearchDelegate?
    
    lazy var searchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = Names.PlaceholderNames.searchBar.rawValue
        searchBar.backgroundImage = UIImage()
        return searchBar
    }()
    
    private let divider = BaseDivider()
    
    private let searchedWordView = UIView()
    
    private let searchedWordTitleLabel = {
        let label = UILabel()
        label.text = "최근 검색"
        label.font = Fonts.sub
        label.textColor = Colors.dark
        return label
    }()
    
    private lazy var removeAllButton = {
        let button = UIButton()
        button.setTitle("전체 삭제", for: .normal)
        button.titleLabel?.font = Fonts.context
        button.setTitleColor(Colors.main, for: .normal)
        button.addTarget(self, action: #selector(removeAllButtonClicked), for: .touchUpInside)
        return button
    }()
    
    lazy var searchedWordTableView = {
        let tableView = UITableView()
        tableView.register(SearchedWordTableViewCell.self, forCellReuseIdentifier: SearchedWordTableViewCell.identifier)
        tableView.separatorStyle = .none
        tableView.rowHeight = 40
        return tableView
    }()
    
    private let emptyImageView = {
        let imageView = UIImageView()
        imageView.image = Images.empty
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let emptyLabel = {
        let label = UILabel()
        label.text = Names.TitleNames.empty
        label.font = Fonts.main
        label.textColor = Colors.dark
        label.textAlignment = .center
        return label
    }()
    
    let nicknameLabel = {
        let label = UILabel()
        label.font = Fonts.sub
        label.textColor = Colors.medium
        label.textAlignment = .center
        return label
    }()
    
    override func setViews() {
        super.setViews()
        hideKeyboardWhenTappedAround()
    }
 
    override func configureSubviews() {
        self.addSubview(searchBar)
        self.addSubview(divider)
        self.addSubview(searchedWordView)
        searchedWordView.addSubview(searchedWordTitleLabel)
        searchedWordView.addSubview(removeAllButton)
        self.addSubview(searchedWordTableView)
        self.addSubview(emptyImageView)
        self.addSubview(emptyLabel)
        self.addSubview(nicknameLabel)
    }
    
    override func configureConstraints() {
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide)
            make.horizontalEdges.equalTo(self.safeAreaLayoutGuide).inset(10)
            make.height.equalTo(44)
        }
        
        divider.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom).offset(10)
            make.horizontalEdges.equalTo(self.safeAreaLayoutGuide)
        }
        
        searchedWordView.snp.makeConstraints { make in
            make.top.equalTo(divider.snp.bottom)
            make.horizontalEdges.equalTo(self.safeAreaLayoutGuide)
            make.height.equalTo(44)
        }
        
        searchedWordTitleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(24)
            make.centerY.equalToSuperview()
        }
        
        removeAllButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(24)
            make.centerY.equalToSuperview()
        }
        
        searchedWordTableView.snp.makeConstraints { make in
            make.top.equalTo(searchedWordView.snp.bottom)
            make.horizontalEdges.equalTo(self.safeAreaLayoutGuide)
            make.bottom.equalTo(self.safeAreaLayoutGuide).inset(50)
        }
        
        emptyImageView.snp.makeConstraints { make in
            make.horizontalEdges.centerY.equalToSuperview()
            make.height.equalTo(240)
        }
        
        emptyLabel.snp.makeConstraints { make in
            make.top.equalTo(emptyImageView.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
        
        nicknameLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(self.safeAreaLayoutGuide).inset(14)
        }
    }
    
    @objc func removeAllButtonClicked(_ sender: UIButton) {
        delegate?.removeAllAction()
    }
    
    func configureSearchView(count: Int) {
        if count == 0 {
            emptyImageView.isHidden = false
            emptyLabel.isHidden = false
            
            searchedWordView.isHidden = true
            searchedWordTableView.isHidden = true
        } else {
            emptyImageView.isHidden = true
            emptyLabel.isHidden = true
            
            searchedWordView.isHidden = false
            searchedWordTableView.isHidden = false
        }
    }
    
    func reloadNicknameLabel(text: String) {
        nicknameLabel.text = text
        nicknameLabel.withMultipleColor(Colors.light, range: "님 반가워요!")
    }
}

protocol SearchDelegate: AnyObject {
    
    func removeAllAction()
}
