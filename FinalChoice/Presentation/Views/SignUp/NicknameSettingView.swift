//
//  NicknameSettingView.swift
//  FinalChoice
//
//  Created by 서충원 on 6/14/24.
//

import UIKit

class NicknameSettingView: BaseView {
    
    weak var delegate: NicknameSettingDelegate?
    
    private let divider = BaseDivider()
    
    private lazy var profileView = BaseProfileView() {
        self.delegate?.profileViewAction()
    }
    
    private lazy var nicknameTextField = BaseTextField(placeHolder: .nickname) { text in
        self.delegate?.nicknameTextFieldAction(text)
    }
    
    private let nicknameDivider = BaseDivider()
    
    let stateLabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = Colors.main
        label.font = Fonts.context
        return label
    }()
    
    lazy var completeButton = BaseButton(name: Names.ButtonNames.complete, state: Names.ButtonCellStates.deselected) { sender in
        self.delegate?.completeButtonAction()
    }
    
    override func setViews() {
        super.setViews()
        hideKeyboardWhenTappedAround()
        nicknameTextField.delegate = self
    }
  
    
    override func configureSubviews() {
        self.addSubview(divider)
        self.addSubview(profileView)
        self.addSubview(nicknameTextField)
        self.addSubview(nicknameDivider)
        self.addSubview(stateLabel)
        self.addSubview(completeButton)
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
        
        nicknameTextField.snp.makeConstraints { make in
            make.top.equalTo(profileView.snp.bottom).offset(40)
            make.horizontalEdges.equalToSuperview().inset(36)
            make.height.equalTo(48)
        }
        
        nicknameDivider.snp.makeConstraints { make in
            make.top.equalTo(nicknameTextField.snp.bottom)
            make.horizontalEdges.equalToSuperview().inset(24)
        }
        
        stateLabel.snp.makeConstraints { make in
            make.top.equalTo(nicknameDivider).offset(10)
            make.horizontalEdges.equalTo(nicknameTextField)
        }
        
        completeButton.snp.makeConstraints { make in
            make.top.equalTo(stateLabel.snp.bottom).offset(24)
            make.horizontalEdges.equalToSuperview().inset(24)
            make.height.equalTo(48)
        }
    }
    
    func setProfileImage(number: Int) {
        profileView.profileImageView.image = Images.profile(number)
    }
    
    func setNicknameLabel(nickname: String) {
        nicknameTextField.text = nickname
    }
    
    func changeNicknameAppearance(state: Names.NicknameStateNames) {
        stateLabel.text = state.rawValue
        
        UIView.animate(withDuration: 0.5) {
            switch state {
            case .successNickname:
                self.completeButton.backgroundColor = Colors.main
                self.completeButton.isEnabled = true
            default:
                self.completeButton.backgroundColor = Colors.light
                self.completeButton.isEnabled = false
            }
        }
    }
    
    ///Call When NicknameSettingView Reuse
    func hideCompleteButton() {
        completeButton.isHidden = true
    }
}

//MARK: - UITextFieldDelegate
extension NicknameSettingView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.endEditing(true)
        return true
    }
}

protocol NicknameSettingDelegate: AnyObject {
    
    func profileViewAction()
    
    func nicknameTextFieldAction(_ text: String)
    
    func completeButtonAction()
}
