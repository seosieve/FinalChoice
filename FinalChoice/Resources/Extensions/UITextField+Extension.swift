//
//  UITextField+Extension.swift
//  FinalChoice
//
//  Created by 서충원 on 6/15/24.
//

import UIKit

extension UITextField {
    func setUpPlaceholderAppearance() {
        guard let string = self.placeholder else { return }
        attributedPlaceholder = NSAttributedString(string: string, attributes: [.foregroundColor: Colors.medium])
    }
}
