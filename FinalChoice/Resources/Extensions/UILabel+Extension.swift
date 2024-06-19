//
//  UILabel+Extension.swift
//  FinalChoice
//
//  Created by 서충원 on 6/17/24.
//

import UIKit

extension UILabel {
    // Multiple Colored Attributed Label
    func withMultipleColor(_ color: UIColor, range: String) {
        let attributedString = NSMutableAttributedString(string: self.text!)
        attributedString.addAttribute(.foregroundColor, value: color, range: (self.text! as NSString).range(of: range))
        self.attributedText = attributedString
    }
}
