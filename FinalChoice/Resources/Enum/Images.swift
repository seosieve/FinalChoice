//
//  Images.swift
//  FinalChoice
//
//  Created by 서충원 on 6/14/24.
//

import UIKit

enum Images {
    static let launch = UIImage(named: "launch")
    static let camera = UIImage(systemName: "camera.fill")!.withRenderingMode(.alwaysTemplate)
    
    static func profile(_ number: Int) -> UIImage {
        return UIImage(named: "profile_\(number)")!
    }
}
