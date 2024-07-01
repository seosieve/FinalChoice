//
//  BaseSortButton.swift
//  FinalChoice
//
//  Created by 서충원 on 6/16/24.
//

import UIKit
import SnapKit

class BaseSortButton: UIButton {
    
    private var action: ((Names.ButtonNames) -> ())?
    var buttonName: Names.ButtonNames!
    
    var buttonState: Names.ButtonCellStates! {
        didSet { buttonStateToggleAction(state: buttonState) }
    }
    
    init(name: Names.ButtonNames, state: Names.ButtonCellStates = .deselected, action: @escaping (Names.ButtonNames) -> ()) {
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
    
    private func buttonStateToggleAction(state: Names.ButtonCellStates) {
        self.backgroundColor = state == .selected ? Colors.dark : Colors.white
        let titleColor = state == .selected ? Colors.white : Colors.medium
        self.setTitleColor(titleColor, for: .normal)
        self.layer.borderWidth = state == .selected ? 0 : 1.3
    }
}
