//
//  SearchedWordTableViewCell.swift
//  FinalChoice
//
//  Created by 서충원 on 6/18/24.
//

import UIKit
import SnapKit

class SearchedWordTableViewCell: UITableViewCell {

    private let clockImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = Images.clock
        imageView.tintColor = Colors.medium
        return imageView
    }()
    
    private let searchedWordLabel = {
        let label = UILabel()
        label.text = "맥북 거치대"
        label.font = Fonts.context
        label.textColor = Colors.dark
        return label
    }()
    
    lazy var removeButton = {
        let button = UIButton()
        button.setImage(Images.xmark, for: .normal)
        button.tintColor = Colors.light
//        button.backgroundColor = .red
        return button
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
        contentView.addSubview(clockImageView)
        contentView.addSubview(searchedWordLabel)
        contentView.addSubview(removeButton)
    }
    
    private func configureConstraints() {
        clockImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(24)
            make.centerY.equalToSuperview()
            make.size.equalTo(16)
        }
        
        searchedWordLabel.snp.makeConstraints { make in
            make.leading.equalTo(clockImageView.snp.trailing).offset(10)
            make.centerY.equalToSuperview()
        }
        
        removeButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(12)
            make.centerY.equalToSuperview()
            make.size.equalTo(40)
        }
    }
    
    func configureCell(word: String) {
        searchedWordLabel.text = word
    }
}
