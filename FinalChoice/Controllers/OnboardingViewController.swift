//
//  OnboardingViewController.swift
//  FinalChoice
//
//  Created by 서충원 on 6/13/24.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    var onboardingView = OnboardingView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = onboardingView
        onboardingView.delegate = self
    }
}

//MARK: - OnboardingDelegate
extension OnboardingViewController: OnboardingDelegate {
    func startButtonAction() {
        let vc = NicknameSettingViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
