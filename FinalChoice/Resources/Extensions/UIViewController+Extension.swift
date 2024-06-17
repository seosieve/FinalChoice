//
//  UIViewController+Extension.swift
//  FinalChoice
//
//  Created by 서충원 on 6/17/24.
//

import UIKit

extension UIViewController {
    // Remove Back Button Title
    func removeBackButtonTitle() {
        let backBarButtonItem = UIBarButtonItem(title: "")
        self.navigationItem.backBarButtonItem = backBarButtonItem
    }
    
    func withdrawAlert(_ alertHandler: @escaping () -> Void) {
        let alert = UIAlertController(title: "정말로 탈퇴하시겠어요?", message: "탈퇴를 하면 데이터가 모두 초기화됩니다. 탈퇴하시겠습니까?", preferredStyle: .alert)
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        let action = UIAlertAction(title: "탈퇴하기", style: .default) { action in
            alertHandler()
        }
        alert.addAction(cancel)
        alert.addAction(action)
        action.setValue(Colors.main, forKey: "titleTextColor")
        alert.view.tintColor = Colors.dark
        present(alert, animated: true, completion: nil)
    }
}
