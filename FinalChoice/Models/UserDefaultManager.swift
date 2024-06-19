//
//  UserDefaultManager.swift
//  FinalChoice
//
//  Created by 서충원 on 6/17/24.
//

import UIKit

@propertyWrapper
struct UserDefault<T> {
    
    let key: String
    let defaultValue: T
    
    var wrappedValue: T {
        get { UserDefaultManager.userdefaults.object(forKey: key) as? T ?? defaultValue }
        set { UserDefaultManager.userdefaults.set(newValue, forKey: key) }
    }
}

struct UserDefaultManager {
    static let userdefaults = UserDefaults.standard
    
    enum Keys: String {
        case profileImage
        case nickname
        case register
        case likeCount
        case searchedText
    }
    
    // Profile Image
    @UserDefault(key: Keys.profileImage.rawValue, defaultValue: 0)
    static var profileImage: Int
    
    // Nickname
    @UserDefault(key: Keys.nickname.rawValue, defaultValue: nil)
    static var nickname: String?
    
    // Register Date
    @UserDefault(key: Keys.register.rawValue, defaultValue: nil)
    static var register: String?
    
    // Like
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
    
    // Like Count
    static var likeCount: Int {
        return userdefaults.integer(forKey: Keys.likeCount.rawValue)
    }
    
    static func changeLikeCount(_ value: Int) {
        let count = userdefaults.integer(forKey: Keys.likeCount.rawValue)
        userdefaults.set(count+value, forKey: Keys.likeCount.rawValue)
    }
    
    // Searched Text
    static var searchedText: [String] {
        return userdefaults.stringArray(forKey: Keys.searchedText.rawValue) ?? [String]()
    }
    
    static func addSearchedText(text: String) {
        var arr = searchedText.filter{ $0 != text }
        arr.insert(text, at: 0)
        userdefaults.set(arr, forKey: Keys.searchedText.rawValue)
    }
    
    static func removeSearchedText(text: String) {
        let arr = searchedText.filter{ $0 != text }
        userdefaults.set(arr, forKey: Keys.searchedText.rawValue)
    }
    
    static func removeAllSearchedText() {
        userdefaults.removeObject(forKey: Keys.searchedText.rawValue)
    }
    
    static func deleteAll() {
        for key in userdefaults.dictionaryRepresentation().keys {
            userdefaults.removeObject(forKey: key.description)
        }
    }
}
