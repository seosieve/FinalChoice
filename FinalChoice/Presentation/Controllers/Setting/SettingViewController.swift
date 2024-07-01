//
//  SettingViewController.swift
//  FinalChoice
//
//  Created by 서충원 on 6/16/24.
//

import UIKit

class SettingViewController: UIViewController {
    
    private var customView = SettingView()
    private var customModel = SettingModel()

    override func loadView() {
        self.view = customView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = Names.NavigationTitleNames.setting
        customView.delegate = self
        customView.settingTableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let imageNumber = customModel.getUserImage()
        let nickname = customModel.getUserNickname()
        let register = customModel.makeRegisterDate()
        let likeCount = customModel.getUserLikeCount()
        customView.reloadUserProfile(imageNumber: imageNumber, nickname: nickname, register: register, likeCount: likeCount)
    }
}

//MARK: - UITableViewDelegate
extension SettingViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard indexPath.row == 4 else { return }
        withdrawAlert {
            ///Delete User & Reset Initial View
            self.customModel.deleteAllUserInfo()
            
            let vc = UINavigationController(rootViewController: OnboardingViewController())
            vc.navigationBar.setUpBarAppearance()
            self.makeInitialView(vc)
        }
    }
}

//MARK: - SettingDelegate
extension SettingViewController: SettingDelegate {
    func profileSettingAction() {
        let vc = NicknameChangeViewController(number: customModel.imageNumber, nickname: customModel.nickname)
        vc.delegate = self
        self.removeBackButtonTitle()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

//MARK: - NicknameChangeDelegate
extension SettingViewController: NicknameChangeDelegate {
    func sendChangedProfile(number: Int, nickname: String) {
        if customModel.imageNumber != number {
            ///When Profile Image Changed
            self.view.makeToast("프로필 이미지 변경이 완료되었습니다.", position: .center)
            customModel.imageNumber = number
        } else {
            ///When Nickname Changed
            if customModel.nickname != nickname {
                self.view.makeToast("닉네임 변경이 완료되었습니다.", position: .center)
                customModel.nickname = nickname
            }
        }
    }
}
