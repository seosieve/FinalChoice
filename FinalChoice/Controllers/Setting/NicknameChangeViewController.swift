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
    
    weak var delegate: NicknameChangeDelegate?

    init(number: Int, nickname: String) {
        super.init(nibName: nil, bundle: nil)
        customModel.number = number
        customModel.nickname = nickname
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = customView
        navigationItem.title = NavigationTitleNames.setting
        customView.delegate = self
        customView.hideCompleteButton()
        customView.setProfileImage(number: customModel.number)
        customView.setNicknameLabel(nickname: customModel.nickname)
        let state = customModel.makeStateString(customModel.nickname)
        customModel.state = state
        customView.changeNicknameAppearance(state: state)
        let saveButton = UIBarButtonItem(title: "저장", style: .plain, target: self, action: #selector(saveButtonClicked))
        saveButton.setTitleTextAttributes([.font: Fonts.main, .foregroundColor: Colors.medium], for: .normal)
        navigationItem.rightBarButtonItem = saveButton
    }
    
    @objc func saveButtonClicked(_ sender: UIBarButtonItem) {
        switch customModel.state {
        case .successNickname:
            delegate?.sendChangedProfile(number: customModel.number, nickname: customModel.nickname)
            customModel.changeProfile()
            self.navigationController?.popViewController(animated: true)
        default:
            self.view.makeToast(customModel.state.rawValue, position: .center)
        }
    }
}

//MARK: - NicknameSettingDelegate
extension NicknameChangeViewController: NicknameSettingDelegate {
    
    func profileViewAction() {
        let vc = ImageChangeViewController(number: customModel.number)
        vc.delegate = self
        self.removeBackButtonTitle()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func nicknameTextFieldAction(_ text: String) {
        let state = customModel.makeStateString(text)
        customModel.state = state
        customView.changeNicknameAppearance(state: state)
        if state == .successNickname {
            customModel.nickname = text
        }
    }
    
    func completeButtonAction() {
        print(#function)
    }
}

//MARK: - SelectedProfileDelegate
extension NicknameChangeViewController: SelectedProfileDelegate {
    func sendImageNumber(number: Int) {
        customModel.number = number
        customView.setProfileImage(number: customModel.number)
    }
}

protocol NicknameChangeDelegate: AnyObject {
    func sendChangedProfile(number: Int, nickname: String)
}
