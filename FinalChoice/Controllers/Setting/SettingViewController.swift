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
    }
}
