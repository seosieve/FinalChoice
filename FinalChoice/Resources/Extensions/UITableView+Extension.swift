//
//  UITableView+Extension.swift
//  FinalChoice
//
//  Created by 서충원 on 6/18/24.
//

import UIKit

extension UITableView {
    // Detect IndexPath by CGPoint
    func getIndexPath(_ sender: UIButton) -> IndexPath? {
        let hitPoint = sender.convert(CGPoint.zero, to: self)
        guard let indexPath = self.indexPathForRow(at: hitPoint) else { return nil }
        return indexPath
    }
}
