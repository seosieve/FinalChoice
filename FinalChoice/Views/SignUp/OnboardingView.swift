//
//  OnboardingView.swift
//  FinalChoice
//
//  Created by 서충원 on 6/14/24.
//

import UIKit

class OnboardingView: BaseView {
    
    weak var delegate: OnboardingDelegate?
    
    private let appImageView = {
        let imageView = UIImageView()
        imageView.image = Images.launch
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    private let appNameLabel = {
        let label = UILabel()
        label.text = Names.appName
        label.font = Fonts.title
        label.textColor = Colors.main
        label.textAlignment = .center
        label.alpha = 0
        return label
    }()
    
    private lazy var startButton = BaseButton(name: ButtonNames.start) { sender in
        self.delegate?.startButtonAction()
    }
    
    override func setViews() {
        super.setViews()
        UIView.animate(withDuration: 1.0, delay: 0.3) {
            self.appNameLabel.alpha = 1
        }
    }
    
    override func configureSubviews() {
        self.addSubview(appImageView)
        self.addSubview(appNameLabel)
        self.addSubview(startButton)
    }
    
    override func configureConstraints() {
        appImageView.snp.makeConstraints { make in
            make.horizontalEdges.centerY.equalToSuperview()
            make.height.equalTo(350)
        }
        
        appNameLabel.snp.makeConstraints { make in
            make.bottom.equalTo(appImageView.snp.top).offset(-20)
            make.horizontalEdges.equalToSuperview().inset(30)
        }
        
        startButton.snp.makeConstraints { make in
            make.bottom.equalTo(self.safeAreaLayoutGuide).offset(-24)
            make.horizontalEdges.equalToSuperview().inset(24)
            make.height.equalTo(48)
        }
    }
}

protocol OnboardingDelegate: AnyObject {
    
    func startButtonAction()
}

