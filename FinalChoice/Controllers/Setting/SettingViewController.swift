//
//  SettingViewController.swift
//  FinalChoice
//
//  Created by 서충원 on 6/16/24.
//

import UIKit

class SettingViewController: UIViewController {
    
    private var customView = SettingView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = customView
        navigationItem.title = NavigationTitleNames.setting
        customView.delegate = self
        customView.settingTableView.delegate = self
    }
}

//MARK: - UITableViewDelegate
extension SettingViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard indexPath.row == 4 else { return }
        withdrawAlert() { 
            print("aa")
        }
    }
}

//MARK: - SettingDelegate
extension SettingViewController: SettingDelegate {
    func profileSettingAction() {
        let vc = NicknameChangeViewController()
        self.removeBackButtonTitle()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
