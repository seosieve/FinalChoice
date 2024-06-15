//
//  Names.swift
//  FinalChoice
//
//  Created by 서충원 on 6/14/24.
//

import Foundation

enum Names {
    static let appName = "FINAL CHOICE"
}

enum ButtonNames: String {
    case start = "시작하기"
    case complete = "완료"
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
}

enum PlaceholderNames: String {
    case nickname = "닉네임을 입력해주세요 :)"
}

enum NicknameStateNames: String {
    case emptyNickname = ""
    case successNickname = "사용할 수 있는 닉네임이에요."
    case errorWithLength = "2글자 이상 10글자 미만으로 설정해주세요."
    case errorWithSymbol = "닉네임에 @, #, $, %는 포함할 수 없어요."
    case errorWithNumber = "닉네임에 숫자는 포함할 수 없어요."
}


