//
//  SearchResultCollectionViewCell.swift
//  FinalChoice
//
//  Created by 서충원 on 6/16/24.
//

import UIKit
import SnapKit
import Kingfisher

class SearchResultCollectionViewCell: UICollectionViewCell {
    
    private lazy var resultImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .gray
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = true
        return imageView
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
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
    }
    
    private func configureSubviews() {
        self.addSubview(resultImageView)
        self.addSubview(sellerLabel)
        self.addSubview(productNameLabel)
        self.addSubview(priceLabel)
    }
    
    private func configureConstraints() {
        resultImageView.snp.makeConstraints { make in
            make.top.horizontalEdges.equalToSuperview()
            make.height.equalTo(resultImageView.snp.width).multipliedBy(1.2)
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
        let image = URL(string: item.image)
        resultImageView.kf.setImage(with: image)
        
        sellerLabel.text = item.mallName
        productNameLabel.text = item.titleString
        priceLabel.text = item.lprice
    }
}
