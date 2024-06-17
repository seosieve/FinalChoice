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
    
    private lazy var simButton = BaseSortButton(name: ButtonNames.sim, state: ButtonCellStates.selected) { name in
        self.delegate?.sortButtonAction(.sim)
    }
    
    private lazy var dateButton = BaseSortButton(name: ButtonNames.date) { name in
        self.delegate?.sortButtonAction(.date)
    }
    
    private lazy var dscButton = BaseSortButton(name: ButtonNames.dsc) { name in
        self.delegate?.sortButtonAction(.dsc)
    }
    
    private lazy var ascButton = BaseSortButton(name: ButtonNames.asc) { name in
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
 
    override func configureSubviews() {
        self.addSubview(divider)
        self.addSubview(resultCountLabel)
        self.addSubview(sortButttonStackView)
        sortButttonStackView.addArrangedSubview(simButton)
        sortButttonStackView.addArrangedSubview(dateButton)
        sortButttonStackView.addArrangedSubview(dscButton)
        sortButttonStackView.addArrangedSubview(ascButton)
        self.addSubview(searchResultCollectionView)
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
    }
    
    func reloadSortButttons(name: ButtonNames) {
        for subview in sortButttonStackView.arrangedSubviews {
            guard let sortButton = subview as? BaseSortButton else { return }
            sortButton.buttonState = sortButton.buttonName == name ? .selected : .deselected
        }
    }
    
    func makeinitalView(_ itemResult: ItemResult) {
        if resultCountLabel.text == nil {
            resultCountLabel.text = itemResult.itemsString
        }
        searchResultCollectionView.reloadData()
    }
}

protocol SearchResultDelegate: AnyObject {
    func sortButtonAction(_ name: ButtonNames)
}
