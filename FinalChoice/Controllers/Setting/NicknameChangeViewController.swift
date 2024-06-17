//
//  NicknameChangeViewController.swift
//  FinalChoice
//
//  Created by 서충원 on 6/17/24.
//

import UIKit
import Toast

class NicknameChangeViewController: UIViewController {

    //Reuse CustomView, CustomModel
    private var customView = NicknameSettingView()
    private var customModel = NicknameSettingModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = customView
        navigationItem.title = NavigationTitleNames.setting
        customView.delegate = self
        customView.hideCompleteButton()
        
        let saveButton = UIBarButtonItem(title: "저장", style: .plain, target: self, action: #selector(saveButtonClicked))
        navigationItem.rightBarButtonItem = saveButton
    }
    
    @objc func saveButtonClicked(_ sender: UIBarButtonItem) {
        print(#function)
        self.view.makeToast("안대애", position: .center)
    }
}

//MARK: - NicknameSettingDelegate
extension NicknameChangeViewController: NicknameSettingDelegate {
    
    func profileViewAction() {
//        let vc = ImageSettingViewController(number: customModel.number)
//        vc.delegate = self
//        self.removeBackButtonTitle()
//        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func nicknameTextFieldAction(_ text: String) {
        let state = customModel.makeStateString(text)
        customView.changeNicknameAppearance(state: state)
    }
    
    func completeButtonAction() {
        print(#function)
    }
}
