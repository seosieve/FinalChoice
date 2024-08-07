//
//  NicknameSettingViewController.swift
//  FinalChoice
//
//  Created by 서충원 on 6/14/24.
//

import UIKit

//Observer
class NicknameSettingViewController: UIViewController {
    private var customView = NicknameSettingView()
    private var customModel = NicknameSettingModel()
    
    override func loadView() {
        self.view = customView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = Names.NavigationTitleNames.profile
        customView.setProfileImage(number: customModel.number)
        customView.delegate = self
    }
}

//MARK: - NicknameSettingDelegate
extension NicknameSettingViewController: NicknameSettingDelegate {
    
    func profileViewAction() {
        ///Keyboard Down When Push
        self.view.endEditing(true)
        let vc = ImageSettingViewController(number: customModel.number)
        vc.delegate = self
        self.removeBackButtonTitle()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func nicknameTextFieldAction(_ text: String) {
        let state = customModel.makeStateString(text)
        customView.changeNicknameAppearance(state: state)
        customModel.nickname = text
    }
    
    func completeButtonAction() {
        ///Make User & Reset Initial View
        customModel.makeUserProfile()
        
        let vc = TabBarViewController()
        makeInitialView(vc)
    }
}

//MARK: - SelectedProfileDelegate
extension NicknameSettingViewController: SelectedProfileDelegate {
    func sendImageNumber(number: Int) {
        customModel.number = number
        customView.setProfileImage(number: customModel.number)
    }
}
