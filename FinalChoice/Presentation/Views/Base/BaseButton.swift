//
//  BaseButton.swift
//  FinalChoice
//
//  Created by 서충원 on 6/14/24.
//

import UIKit

class BaseButton: UIButton {
    
    private var action: ((UIButton) -> ())?
    
    init(name: Names.ButtonNames, state: Names.ButtonCellStates = .selected, action: @escaping (UIButton) -> ()) {
        super.init(frame: .zero)
        self.action = action
        self.backgroundColor = state == .selected ? Colors.main : Colors.light
        self.setTitle(name.rawValue, for: .normal)
        self.setTitleColor(Colors.white, for: .normal)
        self.titleLabel?.font = Fonts.main
        self.isEnabled = state == .selected ? true : false
        self.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    ///After Height Decided
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = self.frame.height / 2
    }
    
    @objc private func buttonAction(_ sender: UIButton) {
        action?(sender)
    }
}
