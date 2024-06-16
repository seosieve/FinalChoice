//
//  BaseView.swift
//  FinalChoice
//
//  Created by 서충원 on 6/14/24.
//

import UIKit
import SnapKit

class BaseView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setViews()
        configureSubviews()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setViews() {
        backgroundColor = Colors.white
    }
    
    func configureSubviews() {
        //Add SubViews
    }
    
    func configureConstraints() {
        //Add Constraints
    }
}
