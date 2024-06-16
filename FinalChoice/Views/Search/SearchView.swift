//
//  SearchView.swift
//  FinalChoice
//
//  Created by 서충원 on 6/16/24.
//

import UIKit

class SearchView: BaseView {
    
    lazy var searchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = PlaceholderNames.searchBar.rawValue
        searchBar.backgroundImage = UIImage()
        return searchBar
    }()
    
    private let divider = BaseDivider()
    
    private let emptyImageView = {
        let imageView = UIImageView()
        imageView.image = Images.empty
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let emptyLabel = {
        let label = UILabel()
        label.text = Names.empty
        label.font = Fonts.main
        label.textColor = Colors.dark
        label.textAlignment = .center
        return label
    }()
 
    override func configureSubviews() {
        self.addSubview(searchBar)
        self.addSubview(divider)
        self.addSubview(emptyImageView)
        self.addSubview(emptyLabel)
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
        
        emptyImageView.snp.makeConstraints { make in
            make.horizontalEdges.centerY.equalToSuperview()
            make.height.equalTo(240)
        }
        
        emptyLabel.snp.makeConstraints { make in
            make.top.equalTo(emptyImageView.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
    }
}
