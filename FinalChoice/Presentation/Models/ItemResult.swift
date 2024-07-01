//
//  ItemResult.swift
//  FinalChoice
//
//  Created by 서충원 on 6/17/24.
//

import UIKit

//MARK: - ItemResult
struct ItemResult: Decodable {
    let total: Int
    var start: Int
    var items: [Item]
}

extension ItemResult {
    var itemsString: String {
        return total == 0 ? "결과가 없어요.." : total.formatted() + "개의 검색 결과"
    }
    
    static var dummy: ItemResult {
        return ItemResult(total: 0, start: 1, items: [Item]())
    }
}

//MARK: - Item
struct Item: Decodable {
    let title: String
    let image: String
    let lprice: String
    let mallName: String
    let link: String
    let productId: String
}

extension Item {
    var titleString: String {
        return title.replacingOccurrences(of: "<b>", with: "").replacingOccurrences(of: "</b>", with: "")
    }
    
    var priceString: String {
        return Int(lprice)!.formatted() + "원"
    }
}
