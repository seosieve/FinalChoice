//
//  SettingModel.swift
//  FinalChoice
//
//  Created by 서충원 on 6/18/24.
//

import UIKit

struct SettingModel {
    lazy var imageNumber = getUserImage()
    lazy var nickname = getUserNickname()
    
    func getUserImage() -> Int {
        return UserDefaultManager.profileImage
    }
    
    func getUserNickname() -> String {
        return UserDefaultManager.nickname ?? ""
    }
    
    func getUserLikeCount() -> Int {
        return UserDefaultManager.likeCount
    }
    
    func makeRegisterDate() -> String {
        let registerDate = UserDefaultManager.register!
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyyMMdd"
        let date = inputFormatter.date(from: registerDate)
        
        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = "yyyy. MM. dd"
        return outputFormatter.string(from: date!) + " 가입"
    }
    
    func deleteAllUserInfo() {
        UserDefaultManager.deleteAll()
    }
}
