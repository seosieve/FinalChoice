//
//  UICollectionViewCell+Extension.swift
//  FinalChoice
//
//  Created by 서충원 on 6/15/24.
//

import UIKit

extension UICollectionViewCell: ReusableIdentifier {
    static var identifier: String {
        return String(describing: self)
    }
}
