//
//  SearchResultCollectionViewCell.swift
//  FinalChoice
//
//  Created by 서충원 on 6/16/24.
//

import UIKit
import SnapKit
import Kingfisher

protocol SearchResultCellDelegate: AnyObject {
    func likeButtonAction(_ cell: SearchResultCollectionViewCell, _ item: Item)
}

class SearchResultCollectionViewCell: UICollectionViewCell {
    
    var item: Item!
    var state: Names.ButtonCellStates!
    
    weak var delegate: SearchResultCellDelegate?
    
    lazy var resultImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .gray
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private lazy var likeButton = {
        let button = UIButton()
        button.backgroundColor = Colors.black.withAlphaComponent(0.3)
        button.setImage(Images.like(.selected), for: .normal)
        button.tintColor = Colors.white
        button.layer.cornerRadius = 4
        button.addTarget(self, action: #selector(likeButtonClicked), for: .touchUpInside)
        return button
    }()
    
    private var sellerLabel = {
        let label = UILabel()
        label.text = "네이버"
        label.font = Fonts.little
        label.textColor = Colors.light
        return label
    }()
    
    private var productNameLabel = {
        let label = UILabel()
        label.text = "아이폰 14 프로 256기가(자급제) 기계식 키보드 어쩌고 2줄로 나타내기"
        label.font = Fonts.subContext
        label.textColor = Colors.medium
        label.numberOfLines = 2
        return label
    }()
    
    private var priceLabel = {
        let label = UILabel()
        label.text = "1,533,231원"
        label.font = Fonts.sub
        label.textColor = Colors.dark
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureSubviews()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func likeButtonClicked(_ sender: UIButton) {
        state.toggleState()
        state == .selected ? selectAnimation() : deselectAction()
        
        delegate?.likeButtonAction(self, item)
    }
    
    private func configureSubviews() {
        self.addSubview(resultImageView)
        self.addSubview(likeButton)
        self.addSubview(sellerLabel)
        self.addSubview(productNameLabel)
        self.addSubview(priceLabel)
    }
    
    private func configureConstraints() {
        resultImageView.snp.makeConstraints { make in
            make.top.horizontalEdges.equalToSuperview()
            make.height.equalTo(resultImageView.snp.width).multipliedBy(1.2)
        }
        
        likeButton.snp.makeConstraints { make in
            make.trailing.bottom.equalTo(resultImageView).inset(10)
            make.size.equalTo(30)
        }
        
        sellerLabel.snp.makeConstraints { make in
            make.top.equalTo(resultImageView.snp.bottom).offset(6)
            make.horizontalEdges.equalToSuperview().inset(3)
        }
        
        productNameLabel.snp.makeConstraints { make in
            make.top.equalTo(sellerLabel.snp.bottom).offset(3)
            make.horizontalEdges.equalToSuperview().inset(3)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(productNameLabel.snp.bottom).offset(4)
            make.horizontalEdges.equalToSuperview().inset(3)
        }
    }
    
    func configureCell(item: Item) {
        self.item = item
        let liked = UserDefaultManager.isLiked(item.productId)
        state = liked ? .selected : .deselected
        liked ? selectAction() : deselectAction()
        
        let image = URL(string: item.image)
        resultImageView.kf.setImage(with: image)
        
        sellerLabel.text = item.mallName
        productNameLabel.text = item.titleString
        priceLabel.text = item.priceString
    }
    
    func highlightText(text: String) {
        productNameLabel.withMultipleColor(Colors.black, range: text)
    }
    
    func deselectAction() {
        likeButton.backgroundColor = Colors.black.withAlphaComponent(0.3)
        likeButton.setImage(Images.like(.selected), for: .normal)
        likeButton.tintColor = Colors.white
    }
    
    func selectAction() {
        self.likeButton.backgroundColor = Colors.white
        self.likeButton.setImage(Images.like(.selected), for: .normal)
        self.likeButton.tintColor = Colors.main
    }
    
    func selectAnimation() {
        likeButton.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        UIView.animate(withDuration: 1.2, delay: 0.1, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.1, options: .curveLinear) {
            self.likeButton.transform = CGAffineTransform.identity
            self.selectAction()
        }
    }
}
