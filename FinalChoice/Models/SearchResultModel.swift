//
//  SearchResultModel.swift
//  FinalChoice
//
//  Created by 서충원 on 6/16/24.
//

import UIKit
import Alamofire

struct ItemResult: Decodable {
    let total: Int
    let items: [Item]
}

struct Item: Decodable {
    let title: String
    let image: String
    let lprice: String
    let mallName: String
    
    var titleString: String {
        return title.replacingOccurrences(of: "<b>", with: "").replacingOccurrences(of: "</b>", with: "")
    }
}

struct SearchResultModel {
    
    func shoppingRequest(text: String, handler: @escaping (ItemResult) -> ()) {
        let query = "query=\(text)"
        let headers: HTTPHeaders = ["X-Naver-Client-Id": APIKey.naverClientID, "X-Naver-Client-Secret": APIKey.naverClientSecret]
        
        AF.request(APIURL.shoppingUrl+query, headers: headers).responseDecodable(of: ItemResult.self) { response in
            switch response.result {
            case .success(let value):
                handler(value)
            case .failure(let error):
                print(error)
            }
        }
    }
}
