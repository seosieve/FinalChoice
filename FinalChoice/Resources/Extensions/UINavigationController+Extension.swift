//
//  UINavigationController+Extension.swift
//  FinalChoice
//
//  Created by 서충원 on 6/15/24.
//

import UIKit

extension UINavigationController {
    func setUpBarAppearance() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: 2)
        appearance.titleTextAttributes = [.font: Fonts.nav, .foregroundColor: Colors.dark]
        navigationBar.tintColor = Colors.dark
        navigationBar.topItem?.title = ""
        navigationBar.scrollEdgeAppearance = appearance
    }
}
