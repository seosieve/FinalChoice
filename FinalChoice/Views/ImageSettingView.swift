//
//  ImageSettingView.swift
//  FinalChoice
//
//  Created by 서충원 on 6/15/24.
//


import UIKit

class ImageSettingView: BaseView {
    
    private let identifier = ProfileImageCollectionViewCell.identifier
    
    private var number: Int!
    
    private let divider = BaseDivider()
    
    private lazy var profileView = BaseProfileView() {
        print(#function)
    }
    
    private let profileCollectionViewLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 14
        layout.minimumInteritemSpacing = 14
        layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 0, right: 20)
        return layout
    }()
    
    private lazy var profileCollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: profileCollectionViewLayout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(ProfileImageCollectionViewCell.self, forCellWithReuseIdentifier: identifier)
        return collectionView
    }()
    
    init(number: Int) {
        super.init(frame: .zero)
        self.number = number
        profileView.profileImageView.image = Images.profile(number)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
}

extension ImageSettingView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! ProfileImageCollectionViewCell
        cell.configureCell(index: indexPath.item)
        
        if indexPath.item == number {
            cell.configureCell2()
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? ProfileImageCollectionViewCell else { return }
        cell.profileSelectAction()
    }
}

extension ImageSettingView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let layout = collectionViewLayout as? UICollectionViewFlowLayout else { return CGSizeZero }
        let screenWidth = collectionView.frame.width
        let inset = layout.sectionInset.left + layout.sectionInset.right
        let spacing = layout.minimumInteritemSpacing
        let width = (screenWidth - inset - spacing * 3) / 4
        let height = width
        return CGSize(width: width, height: height)
    }
}
    
