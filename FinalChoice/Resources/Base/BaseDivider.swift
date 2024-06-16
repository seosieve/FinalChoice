//
//  BaseDivider.swift
//  FinalChoice
//
//  Created by 서충원 on 6/15/24.
//

import UIKit
import SnapKit

class BaseDivider: UIView {
    init() {
        super.init(frame: .zero)
        self.backgroundColor = Colors.light
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.snp.makeConstraints { make in
            make.height.equalTo(1)
        }
    }
}
