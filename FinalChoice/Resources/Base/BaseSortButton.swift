//
//  BaseSortButton.swift
//  FinalChoice
//
//  Created by 서충원 on 6/16/24.
//

import UIKit
import SnapKit

class BaseSortButton: UIButton {
    
    private var action: ((ButtonNames) -> ())?
    var buttonName: ButtonNames!
    
    var buttonState: ButtonStates! {
        didSet { buttonStateToggleAction(state: buttonState) }
    }
    
    init(name: ButtonNames, state: ButtonStates = .disable, action: @escaping (ButtonNames) -> ()) {
        super.init(frame: .zero)
        self.action = action
        self.buttonName = name
        self.buttonState = state
        self.setTitle(name.rawValue, for: .normal)
        self.titleLabel?.font = Fonts.context
        self.layer.borderColor = Colors.light.cgColor
        buttonStateToggleAction(state: state)
        self.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //Afer Height Decided
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = self.frame.height / 2
        self.snp.updateConstraints { make in
            make.width.equalTo(self.intrinsicContentSize.width + 22)
        }
    }
    
    @objc private func buttonAction(_ sender: UIButton) {
        action?(buttonName)
    }
    
    private func buttonStateToggleAction(state: ButtonStates) {
        self.backgroundColor = state == .enable ? Colors.dark : Colors.white
        let titleColor = state == .enable ? Colors.white : Colors.medium
        self.setTitleColor(titleColor, for: .normal)
        self.layer.borderWidth = state == .enable ? 0 : 1.3
    }
}
