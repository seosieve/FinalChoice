//
//  OnboardingViewController.swift
//  FinalChoice
//
//  Created by 서충원 on 6/13/24.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    private var customView = OnboardingView()
    
    override func loadView() {
        self.view = customView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customView.delegate = self
    }
}

//MARK: - OnboardingDelegate
extension OnboardingViewController: OnboardingDelegate {
    func startButtonAction() {
        let vc = NicknameSettingViewController()
        self.removeBackButtonTitle()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
