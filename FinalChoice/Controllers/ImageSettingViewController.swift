//
//  ImageSettingViewController.swift
//  FinalChoice
//
//  Created by 서충원 on 6/15/24.
//

import UIKit

class ImageSettingViewController: UIViewController {

    private var number: Int!
    
    lazy var imageSettingView = ImageSettingView(number: number)
    var imageSettingModel = NicknameSettingModel()
    
    init(number: Int) {
        super.init(nibName: nil, bundle: nil)
        self.number = number
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = NavigationTitleNames.profile
        self.view = imageSettingView
    }
}
