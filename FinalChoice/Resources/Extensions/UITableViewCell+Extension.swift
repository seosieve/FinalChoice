//
//  UITableViewCell+Extension.swift
//  FinalChoice
//
//  Created by 서충원 on 6/17/24.
//

import UIKit

extension UITableViewCell: ReusableIdentifier {
    // Automatically Create Identifier
    static var identifier: String {
        return String(describing: self)
    }
    
    // Animation when TableView Selected
    func selectionAnimation() {
        if self.isSelected {
            UIView.transition(with: self, duration: 0.5, options: .transitionCrossDissolve) {
                self.setSelected(false, animated: true)
            }
        }
    }
}

