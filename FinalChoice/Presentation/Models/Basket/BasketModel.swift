//
//  BasketModel.swift
//  FinalChoice
//
//  Created by 서충원 on 7/10/24.
//

import Foundation
import RealmSwift

final class BasketModel {
    
    private var repository = BasketRepository()
    
    var result: Results<Basket>
    
    init() {
        self.result = repository.allObjects
    }
}
