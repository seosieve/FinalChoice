//
//  SettingView.swift
//  FinalChoice
//
//  Created by 서충원 on 6/16/24.
//

import UIKit

class SettingView: BaseView {
    
    private let divider = BaseDivider()
 
    override func configureSubviews() {
        self.addSubview(divider)
    }
    
    override func configureConstraints() {
        divider.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(self.safeAreaLayoutGuide)
        }
    }
}
    
    

