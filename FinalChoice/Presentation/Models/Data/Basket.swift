//
//  Basket.swift
//  FinalChoice
//
//  Created by 서충원 on 7/10/24.
//

import Foundation
import RealmSwift

final class Basket: Object {
    @Persisted(primaryKey: true) var key: ObjectId
    @Persisted var productId: String
    @Persisted var title: String
    @Persisted var mallName: String
    @Persisted var price: Int
    
    convenience init(productId: String, title: String, mallName: String, price: Int) {
        self.init()
        self.productId = productId
        self.title = title
        self.mallName = mallName
        self.price = price
    }
}
