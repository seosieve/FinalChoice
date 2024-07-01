//
//  SearchResultView.swift
//  FinalChoice
//
//  Created by 서충원 on 6/16/24.
//

import UIKit

class SearchResultView: BaseView {
    
    weak var delegate: SearchResultDelegate?
    
    private let divider = BaseDivider()
    
    let resultCountLabel = {
        let label = UILabel()
        label.textColor = Colors.main
        label.font = Fonts.sub
        return label
    }()
    
    let sortButttonStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        stackView.spacing = 6
        return stackView
    }()
    
    private lazy var simButton = BaseSortButton(name: Names.ButtonNames.sim, state: Names.ButtonCellStates.selected) { name in
        self.delegate?.sortButtonAction(.sim)
    }
    
    private lazy var dateButton = BaseSortButton(name: Names.ButtonNames.date) { name in
        self.delegate?.sortButtonAction(.date)
    }
    
    private lazy var dscButton = BaseSortButton(name: Names.ButtonNames.dsc) { name in
        self.delegate?.sortButtonAction(.dsc)
    }
    
    private lazy var ascButton = BaseSortButton(name: Names.ButtonNames.asc) { name in
        self.delegate?.sortButtonAction(.asc)
    }
    
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
        self.addSubview(resultCountLabel)
        self.addSubview(sortButttonStackView)
        sortButttonStackView.addArrangedSubview(simButton)
        sortButttonStackView.addArrangedSubview(dateButton)
        sortButttonStackView.addArrangedSubview(dscButton)
        sortButttonStackView.addArrangedSubview(ascButton)
        self.addSubview(searchResultCollectionView)
        self.addSubview(emptyImageView)
        self.addSubview(emptyLabel)
    }
    
    override func configureConstraints() {
        divider.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(self.safeAreaLayoutGuide)
        }
        
        resultCountLabel.snp.makeConstraints { make in
            make.top.equalTo(divider).offset(14)
            make.leading.equalToSuperview().inset(24)
        }
        
        sortButttonStackView.snp.makeConstraints { make in
            make.top.equalTo(resultCountLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().inset(22)
            make.height.equalTo(30)
        }
        
        searchResultCollectionView.snp.makeConstraints { make in
            make.top.equalTo(sortButttonStackView.snp.bottom).offset(8)
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
    
    func reloadSortButttons(name: Names.ButtonNames) {
        for subview in sortButttonStackView.arrangedSubviews {
            guard let sortButton = subview as? BaseSortButton else { return }
            sortButton.buttonState = sortButton.buttonName == name ? .selected : .deselected
        }
    }
    
    func makeInitalView(_ itemResult: ItemResult) {
        // Count Label Setting
        if resultCountLabel.text == nil {
            resultCountLabel.text = itemResult.itemsString
        }
        // If Empty Item Searchd
        if itemResult.items.count == 0 {
            sortButttonStackView.isHidden = true
            emptyImageView.isHidden = false
            emptyLabel.isHidden = false
        } else {
            sortButttonStackView.isHidden = false
            emptyImageView.isHidden = true
            emptyLabel.isHidden = true
        }
        
        searchResultCollectionView.reloadData()
    }
}

protocol SearchResultDelegate: AnyObject {
    func sortButtonAction(_ name: Names.ButtonNames)
}
