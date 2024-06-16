//
//  ImageSettingView.swift
//  FinalChoice
//
//  Created by 서충원 on 6/15/24.
//


import UIKit

class ImageSettingView: BaseView {
    
    private let divider = BaseDivider()
    
    private lazy var profileView = BaseProfileView() { return }
    
    private let profileCollectionViewLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 14
        layout.minimumInteritemSpacing = 14
        layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 0, right: 20)
        let screenWidth = UIScreen.main.bounds.width
        let inset = layout.sectionInset.left + layout.sectionInset.right
        let spacing = layout.minimumInteritemSpacing
        let width = (screenWidth - inset - spacing * 3) / 4
        let height = width
        layout.itemSize = CGSize(width: width, height: height)
        return layout
    }()
    
    lazy var profileCollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: profileCollectionViewLayout)
        collectionView.register(ProfileImageCollectionViewCell.self, forCellWithReuseIdentifier: ProfileImageCollectionViewCell.identifier)
        return collectionView
    }()
    
    override func configureSubviews() {
        self.addSubview(divider)
        self.addSubview(profileView)
        self.addSubview(profileCollectionView)
    }
    
    override func configureConstraints() {
        divider.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(self.safeAreaLayoutGuide)
        }
        
        profileView.snp.makeConstraints { make in
            make.top.equalTo(divider).offset(40)
            make.centerX.equalToSuperview()
            make.size.equalTo(135)
        }
        
        profileCollectionView.snp.makeConstraints { make in
            make.top.equalTo(profileView.snp.bottom).offset(50)
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(profileCollectionView.snp.width).multipliedBy(4/3)
        }
    }
    
    func setRandomProfileImage(number: Int) {
        profileView.profileImageView.image = Images.profile(number)
    }
}
