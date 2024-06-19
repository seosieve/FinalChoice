//
//  UIView+Extension.swift
//  FinalChoice
//
//  Created by 서충원 on 6/17/24.
//

import UIKit

extension UIView {
    // Animation Of Custom Tappable View
    func viewSelectionAnimation() {
        UIView.animate(withDuration: 0.2, animations: {
            self.backgroundColor = Colors.light
        }, completion: { _ in
            UIView.animate(withDuration: 0.2) {
                self.backgroundColor = Colors.white
            }
        })
    }
    
    // Keyboard Down When Tapped
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        tap.cancelsTouchesInView = false
        self.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        self.endEditing(true)
    }
}
