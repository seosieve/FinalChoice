//
//  BasketView.swift
//  FinalChoice
//
//  Created by 서충원 on 7/10/24.
//

import UIKit

class BasketView: BaseView {
    
    private let divider = BaseDivider()
    
    private let searchResultCollectionViewLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 14
        layout.minimumInteritemSpacing = 14
        layout.sectionInset = UIEdgeInsets(top: 8, left: 20, bottom: 20, right: 20)
        let screenWidth = UIScreen.main.bounds.width
        let inset = layout.sectionInset.left + layout.sectionInset.right
        let spacing = layout.minimumInteritemSpacing
        let width = (screenWidth - inset - spacing) / 2
        let height = width + 110
        layout.itemSize = CGSize(width: width, height: height)
        return layout
    }()
    
    lazy var searchResultCollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: searchResultCollectionViewLayout)
        collectionView.register(SearchResultCollectionViewCell.self, forCellWithReuseIdentifier: SearchResultCollectionViewCell.identifier)
        return collectionView
    }()
    
    private let emptyImageView = {
        let imageView = UIImageView()
        imageView.image = Images.empty
        imageView.contentMode = .scaleAspectFit
        imageView.isHidden = true
        return imageView
    }()
    
    private let emptyLabel = {
        let label = UILabel()
        label.text = Names.TitleNames.noResult
        label.font = Fonts.main
        label.textColor = Colors.dark
        label.textAlignment = .center
        label.isHidden = true
        return label
    }()
    
    override func configureSubviews() {
        self.addSubview(divider)
        self.addSubview(searchResultCollectionView)
        self.addSubview(emptyImageView)
        self.addSubview(emptyLabel)
    }
    
    override func configureConstraints() {
        divider.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(self.safeAreaLayoutGuide)
        }
        
        searchResultCollectionView.snp.makeConstraints { make in
            make.top.equalTo(divider).offset(20)
            make.horizontalEdges.bottom.equalTo(self.safeAreaLayoutGuide)
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
