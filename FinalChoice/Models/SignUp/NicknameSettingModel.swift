//
//  NicknameSettingModel.swift
//  FinalChoice
//
//  Created by 서충원 on 6/15/24.
//

import UIKit

struct NicknameSettingModel {
    
    var number = Int.random(in: 0...11)
    
    func makeStateString(_ text: String) -> NicknameStateNames {
        let numberPattern = "(?=.*[0-9])"
        let symbolPattern = "(?=.*[@#$%])"
        //Catch Number Included
        guard text.range(of: numberPattern, options: .regularExpression) == nil else { return .errorWithNumber }
        //Catch Symbol Included
        guard text.range(of: symbolPattern, options: .regularExpression) == nil else { return .errorWithSymbol }
        //Catch Empty Condition
        guard !text.isEmpty else { return .emptyNickname }
        //Catch Length Condition
        guard (2..<10) ~= text.count else { return .errorWithLength }
        //Success
        return .successNickname
    }
}
