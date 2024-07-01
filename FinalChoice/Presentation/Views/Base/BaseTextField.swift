//
//  BaseTextField.swift
//  FinalChoice
//
//  Created by 서충원 on 6/15/24.
//

import UIKit

class BaseTextField: UITextField {
    
    private var action: ((String) -> ())?
    
    init(placeHolder: Names.PlaceholderNames, action: @escaping (String) -> ()) {
        super.init(frame: .zero)
        self.action = action
        self.placeholder = placeHolder.rawValue
        self.setUpPlaceholderAppearance()
        self.addTarget(self, action: #selector(textFieldAction), for: .editingChanged)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func textFieldAction(_ sender: UITextField) {
        guard let text = sender.text?.replacingOccurrences(of: " ", with: "") else { return }
        action?(text)
    }
}
