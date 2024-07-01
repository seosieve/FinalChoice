//
//  SettingTableViewCell.swift
//  FinalChoice
//
//  Created by 서충원 on 6/17/24.
//

import UIKit
import SnapKit

class SettingTableViewCell: UITableViewCell {
    
    private let titleLabel = {
        let label = UILabel()
        label.text = "나의 장바구니 목록"
        label.font = Fonts.sub
        label.textColor = Colors.medium
        return label
    }()
    
    private let productImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = Images.like(.selected)
        imageView.tintColor = Colors.dark
        imageView.isHidden = true
        return imageView
    }()
    
    private let productCountLabel = {
        let label = UILabel()
        label.font = Fonts.sub
        label.textColor = Colors.dark
        label.isHidden = true
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureSubviews()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        selectionAnimation()
    }
    
    private func configureSubviews() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(productImageView)
        contentView.addSubview(productCountLabel)
    }
    
    private func configureConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(24)
            make.centerY.equalToSuperview()
        }
        
        productCountLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(24)
            make.centerY.equalToSuperview()
        }
        
        productImageView.snp.makeConstraints { make in
            make.trailing.equalTo(productCountLabel.snp.leading).offset(-2)
            make.centerY.equalToSuperview()
        }
    }
    
    func configureCell(index: Int, likeCount: Int) {
        if index == 0 {
            productCountLabel.isHidden = false
            productImageView.isHidden = false
        }
        titleLabel.text = Names.SettingListNames.titleArr[index]
        productCountLabel.text = String(likeCount) + "개의 상품"
        productCountLabel.withMultipleColor(Colors.medium, range: "의 상품")
    }
}
