//
//  TabBarViewController.swift
//  FinalChoice
//
//  Created by 서충원 on 6/16/24.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBarAppearance()
        configureTabBar()
        configureTabBarItems()
    }
    
    func setTabBarAppearance() {
        self.tabBar.tintColor = Colors.main
        self.tabBar.layer.borderWidth = 1
        self.tabBar.layer.borderColor = Colors.light.cgColor
    }
    
    func configureTabBar() {
        let searchVC = UINavigationController(rootViewController: SearchViewController(textArr: UserDefaultManager.searchedText))
        searchVC.navigationBar.setUpBarAppearance()
        
        let basketVC = UINavigationController(rootViewController: BasketViewController())
        basketVC.navigationBar.setUpBarAppearance()
        
        let settingVC = UINavigationController(rootViewController: SettingViewController())
        settingVC.navigationBar.setUpBarAppearance()
        
        self.setViewControllers([searchVC, basketVC, settingVC], animated: true)
    }
    
    func configureTabBarItems() {
        guard let items = self.tabBar.items else { return }
        
        let searchImage = UIImage(systemName: "magnifyingglass")
        searchImage?.withTintColor(Colors.light, renderingMode: .alwaysTemplate)
        let basketImage = UIImage(systemName: "basket")
        basketImage?.withTintColor(Colors.light, renderingMode: .alwaysTemplate)
        let settingImage = UIImage(systemName: "person")
        settingImage?.withTintColor(Colors.light, renderingMode: .alwaysTemplate)
        
        items[0].image = searchImage
        items[0].title = "검색"
        items[1].image = basketImage
        items[1].title = "장바구니"
        items[2].image = settingImage
        items[2].title = "설정"
    }
}
