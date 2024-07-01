//
//  ProfileImageCollectionViewCell.swift
//  FinalChoice
//
//  Created by 서충원 on 6/15/24.
//

import UIKit
import SnapKit

class ProfileImageCollectionViewCell: UICollectionViewCell {
    
    var state: ButtonCellStates = ButtonCellStates.deselected {
        didSet { profileToggleAction(state: state) }
    }
    
    private lazy var profileImageView = {
        let imageView = UIImageView()
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = Colors.dark.cgColor
        imageView.layer.masksToBounds = true
        imageView.alpha = 0.5
        return imageView
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
        profileImageView.layer.cornerRadius = profileImageView.frame.height / 2
    }
    
    private func configureSubviews() {
        self.addSubview(profileImageView)
    }
    
    private func configureConstraints() {
        profileImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func configureCell(index: Int) {
        profileImageView.image = Images.profile(index)
    }
    
    func profileToggleAction(state: ButtonCellStates) {
        switch state {
        case .deselected: deselectAction()
        case .selected: selectAction()
        }
    }
    
    func deselectAction() {
        profileImageView.alpha = 0.5
        profileImageView.layer.borderWidth = 1
        profileImageView.layer.borderColor = Colors.dark.cgColor
        self.isUserInteractionEnabled = true
    }
    
    func selectAction() {
        profileImageView.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        UIView.animate(withDuration: 1.5, delay: 0.1, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.1, options: .curveLinear) {
            self.profileImageView.transform = CGAffineTransform.identity
            self.profileImageView.alpha = 1
            self.profileImageView.layer.borderWidth = 3
            self.profileImageView.layer.borderColor = Colors.main.cgColor
            self.isUserInteractionEnabled = false
        }
    }
}
