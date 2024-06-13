//
//  OnboardingViewController.swift
//  FinalChoice
//
//  Created by 서충원 on 6/13/24.
//

import UIKit
import SnapKit

class OnboardingViewController: UIViewController {

    let appNameLabel = {
        let label = UILabel()
        label.text = "FINAL CHOICE"
        label.font = UIFont(name: "ZingRustDemo-Base", size: 40)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(appNameLabel)
        appNameLabel.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(50)
        }
    }

}
