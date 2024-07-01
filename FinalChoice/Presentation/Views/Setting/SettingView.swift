//
//  SettingView.swift
//  FinalChoice
//
//  Created by 서충원 on 6/16/24.
//

import UIKit

class SettingView: BaseView {
    
    weak var delegate: SettingDelegate?
    
    var likeCount = 0
    
    private let divider = BaseDivider()
    
    private lazy var profileContainerView = {
        let view = UIView()
        let tap = UITapGestureRecognizer(target: self, action: #selector(profileViewClicked))
        view.addGestureRecognizer(tap)
        return view
    }()
    
    private let profileImageView = {
        let imageView = UIImageView()
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = Colors.main.cgColor
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 44
        return imageView
    }()
    
    private let nicknameLabel = {
        let label = UILabel()
        label.textColor = Colors.dark
        label.font = Fonts.large
        return label
    }()
    
    private let registerDateLabel = {
        let label = UILabel()
        label.textColor = Colors.medium
        label.font = Fonts.context
        return label
    }()
    
    private let chevronimageView = {
        let imageView = UIImageView()
        imageView.image = Images.chevron
        imageView.tintColor = Colors.light
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let tableViewDivider = {
        let divider = BaseDivider()
        divider.backgroundColor = Colors.light.withAlphaComponent(0.3)
        return divider
    }()
    
    lazy var settingTableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.register(SettingTableViewCell.self, forCellReuseIdentifier: SettingTableViewCell.identifier)
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        tableView.rowHeight = 60
        tableView.isScrollEnabled = false
        return tableView
    }()
 
    override func configureSubviews() {
        self.addSubview(divider)
        self.addSubview(profileContainerView)
        profileContainerView.addSubview(profileImageView)
        profileContainerView.addSubview(nicknameLabel)
        profileContainerView.addSubview(registerDateLabel)
        profileContainerView.addSubview(chevronimageView)
        self.addSubview(tableViewDivider)
        self.addSubview(settingTableView)
    }
    
    override func configureConstraints() {
        divider.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(self.safeAreaLayoutGuide)
        }
        
        profileContainerView.snp.makeConstraints { make in
            make.top.equalTo(divider.snp.bottom)
            make.horizontalEdges.equalTo(self.safeAreaLayoutGuide)
            make.height.equalTo(130)
        }
        
        profileImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(24)
            make.centerY.equalToSuperview()
            make.size.equalTo(88)
        }
        
        nicknameLabel.snp.makeConstraints { make in
            make.leading.equalTo(profileImageView.snp.trailing).offset(20)
            make.bottom.equalTo(profileContainerView.snp.centerY).offset(-2)
        }
        
        registerDateLabel.snp.makeConstraints { make in
            make.top.equalTo(profileContainerView.snp.centerY).offset(4)
            make.leading.equalTo(profileImageView.snp.trailing).offset(20)
        }
        
        chevronimageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(24)
            make.size.equalTo(18)
        }
        
        tableViewDivider.snp.makeConstraints { make in
            make.top.equalTo(profileContainerView.snp.bottom)
            make.horizontalEdges.equalTo(self.safeAreaLayoutGuide)
        }
        
        settingTableView.snp.makeConstraints { make in
            make.top.equalTo(tableViewDivider.snp.bottom)
            make.horizontalEdges.bottom.equalTo(self.safeAreaLayoutGuide)
        }
    }
    
    @objc func profileViewClicked() {
        profileContainerView.viewSelectionAnimation()
        delegate?.profileSettingAction()
    }
    
    func reloadUserProfile(imageNumber: Int, nickname: String, register: String, likeCount: Int) {
        profileImageView.image = Images.profile(imageNumber)
        nicknameLabel.text = nickname
        registerDateLabel.text = register
        self.likeCount = likeCount
        self.settingTableView.reloadRows(at: [[0,0]], with: .automatic)
    }
}

//MARK: - UITableViewDataSource
extension SettingView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Names.SettingListNames.titleArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SettingTableViewCell.identifier, for: indexPath) as! SettingTableViewCell
        cell.configureCell(index: indexPath.row, likeCount: likeCount)
        return cell
    }
}

protocol SettingDelegate: AnyObject {
    func profileSettingAction()
}
    
    

