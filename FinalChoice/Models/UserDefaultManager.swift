//
//  UserDefaultManager.swift
//  FinalChoice
//
//  Created by 서충원 on 6/17/24.
//

import UIKit

struct UserDefaultManager {
    static let userdefaults = UserDefaults.standard
    
    static func isLiked(_ productId: String) -> Bool {
        return userdefaults.bool(forKey: productId)
    }
    
    static func addLike(_ productId: String) {
        userdefaults.set(true, forKey: productId)
        changeLikeCount(1)
    }
    
    static func removeLike(_ productId: String) {
        userdefaults.removeObject(forKey: productId)
        changeLikeCount(-1)
    }
    
    static var likeCount: Int {
        return userdefaults.integer(forKey: "likeCount")
    }
    
    static func changeLikeCount(_ value: Int) {
        let count = userdefaults.integer(forKey: "likeCount")
        userdefaults.set(count+value, forKey: "likeCount")
    }
}
