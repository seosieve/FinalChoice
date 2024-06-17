//
//  UIView+Extension.swift
//  FinalChoice
//
//  Created by 서충원 on 6/17/24.
//

import UIKit

extension UIView {
    func viewSelectionAnimation() {
        UIView.animate(withDuration: 0.2, animations: {
            self.backgroundColor = Colors.light
        }, completion: { _ in
            UIView.animate(withDuration: 0.2) {
                self.backgroundColor = Colors.white
            }
        })
    }
}
