//
//  NicknameSettingViewController.swift
//  FinalChoice
//
//  Created by 서충원 on 6/14/24.
//

import UIKit

class NicknameSettingViewController: UIViewController {
    
    var nicknameSettingView = NicknameSettingView()
    var nicknameSettingModel = NicknameSettingModel()
    
    lazy var number = nicknameSettingModel.randomNumber
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = NavigationTitleNames.profile
        self.view = nicknameSettingView
        setRandomProfileImage()
        nicknameSettingView.delegate = self
    }
    
    func setRandomProfileImage() {
        nicknameSettingView.profileView.profileImageView.image = Images.profile(number)
    }
}

extension NicknameSettingViewController: NicknameSettingDelegate {
    
    func profileViewAction() {
        let vc = ImageSettingViewController(number: number)
        let backBarButtonItem = UIBarButtonItem(title: "")
        navigationItem.backBarButtonItem = backBarButtonItem
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func nicknameTextFieldAction(_ text: String) {
        let state = nicknameSettingModel.makeStateString(text)
        nicknameSettingView.changeNicknameAppearance(state: state)
    }
    
    func completeButtonAction() {
        print(#function)
    }
}
