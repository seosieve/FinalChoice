//
//  NicknameSettingViewController.swift
//  FinalChoice
//
//  Created by 서충원 on 6/14/24.
//

import UIKit

class NicknameSettingViewController: UIViewController {
    
    private var customView = NicknameSettingView()
    private var customModel = NicknameSettingModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = customView
        navigationItem.title = NavigationTitleNames.profile
        customView.setRandomProfileImage(number: customModel.number)
        customView.delegate = self
    }
}

//MARK: - NicknameSettingDelegate
extension NicknameSettingViewController: NicknameSettingDelegate {
    
    func profileViewAction() {
        let vc = ImageSettingViewController(number: customModel.number)
        vc.delegate = self
        self.removeBackButtonTitle()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func nicknameTextFieldAction(_ text: String) {
        let state = customModel.makeStateString(text)
        customView.changeNicknameAppearance(state: state)
    }
    
    func completeButtonAction() {
        print(#function)
    }
}

//MARK: - SelectedProfileDelegate
extension NicknameSettingViewController: SelectedProfileDelegate {
    func sendImageNumber(number: Int) {
        customModel.number = number
        customView.setRandomProfileImage(number: customModel.number)
    }
}
