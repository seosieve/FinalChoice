//
//  Names.swift
//  FinalChoice
//
//  Created by 서충원 on 6/14/24.
//

import Foundation

enum Names {
    enum TitleNames {
        static let appName = "FINAL CHOICE"
        static let empty = "최근 검색어가 없어요"
        static let noResult = "검색 결과가 존재하지 않아요"
    }

    enum ButtonNames: String {
        case start = "시작하기"
        case complete = "완료"
        case sim = "정확도"
        case date = "날짜순"
        case dsc = "가격높은순"
        case asc = "가격낮은순"
    }

    enum ButtonCellStates {
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
        static let basket = "BASKET"
    }

    enum PlaceholderNames: String {
        case nickname = "닉네임을 입력해주세요 :)"
        case searchBar = "브랜드, 상품 등을 입력하세요."
    }

    enum NicknameStateNames: String {
        case emptyNickname = "닉네임을 입력해주세요."
        case successNickname = "사용할 수 있는 닉네임이에요."
        case errorWithLength = "2글자 이상 10글자 미만으로 설정해주세요."
        case errorWithSymbol = "닉네임에 @, #, $, %는 포함할 수 없어요."
        case errorWithNumber = "닉네임에 숫자는 포함할 수 없어요."
    }

    enum SettingListNames {
        static let titleArr = ["나의 장바구니 목록", "자주 묻는 질문", "1:1 문의", "알림 설정", "탈퇴하기"]
    }
}

