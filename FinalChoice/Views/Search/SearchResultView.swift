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
        label.text = "22,311개의 검색 결과"
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
    
    private lazy var accuracyButton = BaseSortButton(name: ButtonNames.accuracy, state: ButtonStates.enable) { name in
        self.delegate?.sortButtonAction(.accuracy)
    }
    
    private lazy var dateButton = BaseSortButton(name: ButtonNames.date) { name in
        self.delegate?.sortButtonAction(.date)
    }
    
    private lazy var highPriceButton = BaseSortButton(name: ButtonNames.highPrice) { name in
        self.delegate?.sortButtonAction(.highPrice)
    }
    
    private lazy var rowPriceButton = BaseSortButton(name: ButtonNames.rowPrice) { name in
        self.delegate?.sortButtonAction(.rowPrice)
    }
    
    private let searchResultCollectionViewLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 14
        layout.minimumInteritemSpacing = 14
        layout.sectionInset = UIEdgeInsets(top: 8, left: 20, bottom: 0, right: 20)
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
        sortButttonStackView.addArrangedSubview(accuracyButton)
        sortButttonStackView.addArrangedSubview(dateButton)
        sortButttonStackView.addArrangedSubview(highPriceButton)
        sortButttonStackView.addArrangedSubview(rowPriceButton)
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
            sortButton.buttonState = sortButton.buttonName == name ? .enable : .disable
        }
    }
    
    func reloadViewByResult() {
        resultCountLabel.text = "dawd"
        searchResultCollectionView.reloadData()
    }
}

protocol SearchResultDelegate: AnyObject {
    func sortButtonAction(_ name: ButtonNames)
}
