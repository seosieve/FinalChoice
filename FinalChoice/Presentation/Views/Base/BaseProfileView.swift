//
//  BaseProfileView.swift
//  FinalChoice
//
//  Created by 서충원 on 6/15/24.
//

import UIKit
import SnapKit

class BaseProfileView: UIView {
    
    private var action: (() -> ())?
    
    var profileImageView = {
        let imageView = UIImageView()
        imageView.layer.borderWidth = 6
        imageView.layer.borderColor = Colors.main.cgColor
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private let cameraContainerView = {
        let imageView = UIImageView()
        imageView.backgroundColor = Colors.main
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private let cameraImageView = {
        let imageView = UIImageView()
        imageView.image = Images.camera
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = Colors.white
        return imageView
    }()
    
    init(action: @escaping () -> ()) {
        super.init(frame: .zero)
        self.action = action
        let tap = UITapGestureRecognizer(target: self, action: #selector(profileViewTapped))
        self.addGestureRecognizer(tap)
        configureSubviews()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func profileViewTapped() {
        action?()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        profileImageView.layer.cornerRadius = profileImageView.frame.height / 2
        cameraContainerView.layer.cornerRadius = cameraContainerView.frame.height / 2
    }
    
    private func configureSubviews() {
        self.addSubview(profileImageView)
        self.addSubview(cameraContainerView)
        cameraContainerView.addSubview(cameraImageView)
    }
    
    private func configureConstraints() {
        profileImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        cameraContainerView.snp.makeConstraints { make in
            make.trailing.bottom.equalToSuperview().inset(5)
            make.size.equalTo(35)
        }
        
        cameraImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(6)
        }
    }
}
