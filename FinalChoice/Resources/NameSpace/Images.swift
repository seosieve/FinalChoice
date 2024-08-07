//
//  Images.swift
//  FinalChoice
//
//  Created by 서충원 on 6/14/24.
//

import UIKit

enum Images {
    static let launch = UIImage(named: "launch")
    static let empty = UIImage(named: "empty")
    
    static let camera = UIImage(systemName: "camera.fill")!.withRenderingMode(.alwaysTemplate)
    static let clock = UIImage(systemName: "clock")
    static let chevron = UIImage(systemName: "chevron.right")
    static let xmark = UIImage(systemName: "xmark")
    
    static func profile(_ number: Int) -> UIImage {
        return UIImage(named: "profile_\(number)")!
    }
    
    static func like(_ state: Names.ButtonCellStates) -> UIImage {
        return state == .selected ? UIImage(named: "like_selected")! : UIImage(named: "like_unselected")!.withRenderingMode(.alwaysOriginal)
    }
}
