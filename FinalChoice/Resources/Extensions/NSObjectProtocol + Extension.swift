//
//  NSObjectProtocol + Extension.swift
//  FinalChoice
//
//  Created by 서충원 on 7/1/24.
//

import Foundation

extension NSObjectProtocol {
    // Automatically Create Identifier
    static var identifier: String {
        return String(describing: self)
    }
}
