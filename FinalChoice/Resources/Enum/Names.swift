//
//  Names.swift
//  FinalChoice
//
//  Created by 서충원 on 6/14/24.
//

import Foundation

enum Names {
    static let appName = "FINAL CHOICE"
    static let empty = "최근 검색어가 없어요"
}

enum ButtonNames: String {
    case start = "시작하기"
    case complete = "완료"
    case accuracy = "정확도"
    case date = "날짜순"
    case highPrice = "가격높은순"
    case rowPrice = "가격낮은순"
}

enum ButtonStates {
    case enable
    case disable
}

enum CellStates {
    case selected
    case deselected
    
    mutating func toggleState() {
        self == .selected ? (self = .deselected) : (self = .selected)
    }
}

enum NavigationTitleNames {
    static let profile = "PROFILE SETTING"
    static let main = "FINAL CHOICE"
    static let setting = "SETTING"
}

enum PlaceholderNames: String {
    case nickname = "닉네임을 입력해주세요 :)"
    case searchBar = "브랜드, 상품 등을 입력하세요."
}

enum NicknameStateNames: String {
    case emptyNickname = ""
    case successNickname = "사용할 수 있는 닉네임이에요."
    case errorWithLength = "2글자 이상 10글자 미만으로 설정해주세요."
    case errorWithSymbol = "닉네임에 @, #, $, %는 포함할 수 없어요."
    case errorWithNumber = "닉네임에 숫자는 포함할 수 없어요."
}


