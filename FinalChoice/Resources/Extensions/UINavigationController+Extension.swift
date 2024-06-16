//
//  UINavigationController+Extension.swift
//  FinalChoice
//
//  Created by 서충원 on 6/15/24.
//

import UIKit

//MARK: - Custom NavigationBar Style
extension UINavigationBar {
    func setUpBarAppearance(isSearch: Bool = false) {
        let font = isSearch ? Fonts.main : Fonts.nav
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: 2)
        appearance.titleTextAttributes = [.font: font, .foregroundColor: Colors.dark]
        
        self.tintColor = Colors.dark
        self.scrollEdgeAppearance = appearance
    }
}

//MARK: - Remove Back Button Title
extension UIViewController {
    func removeBackButtonTitle() {
        let backBarButtonItem = UIBarButtonItem(title: "")
        self.navigationItem.backBarButtonItem = backBarButtonItem
    }
}
