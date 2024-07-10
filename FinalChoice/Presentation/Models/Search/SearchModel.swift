//
//  SearchModel.swift
//  FinalChoice
//
//  Created by 서충원 on 6/18/24.
//

import UIKit

final class SearchModel {
    
    var searchedTextUpdated: ((Int) -> ())?
    
    var searchedTextArr: [String]! {
        didSet { searchedTextUpdated?(searchedTextArr.count) }
    }
    
    func setUserNickname() -> String {
        return UserDefaultManager.nickname! + "님 반가워요!"
    }
    
    func reloadSearchedText() {
        searchedTextArr = UserDefaultManager.searchedText
    }
    
    func removeSearchedText(index: Int) {
        UserDefaultManager.removeSearchedText(text: searchedTextArr[index])
        searchedTextArr.remove(at: index)
    }
    
    func removeAllSearchedText() {
        UserDefaultManager.removeAllSearchedText()
        searchedTextArr.removeAll()
    }
}
