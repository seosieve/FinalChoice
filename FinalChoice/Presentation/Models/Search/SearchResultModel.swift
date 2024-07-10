//
//  SearchResultModel.swift
//  FinalChoice
//
//  Created by 서충원 on 6/16/24.
//

import UIKit
import Alamofire
import RealmSwift

final class SearchResultModel {
    
    var repository = BasketRepository()
    var imageRepository = ImageFileRepository()
    
    let maxLimit = 1000
    var sort = Names.ButtonNames.sim
    
    var itemResultUpdated: ((ItemResult) -> ())?
    
    var itemResult = ItemResult.dummy {
        didSet { itemResultUpdated?(itemResult) }
    }
    
    func shoppingRequest(text: String, sort: Names.ButtonNames, start: Int, handler: @escaping (ItemResult) -> ()) {
        let url = APIURL.shoppingUrl(text: text, sort: sort, start: start)
        let headers = APIURL.headers
        
        AF.request(url, headers: headers).responseDecodable(of: ItemResult.self) { response in
            switch response.result {
            case .success(let value):
                self.configureItemResult(start: start, result: value)
                handler(value)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func configureItemResult(start: Int, result: ItemResult) {
        switch start {
        case 1:
            itemResult = result
        default:
            itemResult.items += result.items
            itemResult.start = result.start
        }
    }
    
    func paginationAction(indexPath: IndexPath, handler: @escaping (Names.ButtonNames, Int) -> ()) {
        let itemCount = itemResult.items.count - 1
        let limit = itemResult.start
        
        if itemCount == indexPath.item && limit < maxLimit {
            handler(sort, limit + 10)
        }
    }
    
    func addBasketAction(_ item: Item) {
        let productId = item.productId
        let title = item.titleString
        let mallName = item.mallName
        let price = Int(item.lprice) ?? 0
        
        let basket = Basket(productId: productId, title: title, mallName: mallName, price: price)
        
        repository.addObject(object: basket)
    }
    
    func deleteBasketAction(_ item: Item) {
        let productId = item.productId
        guard let basket = repository.allObjects.first(where: { $0.productId == productId }) else { return }
        
        repository.deleteObject(object: basket)
    }
    
    func addImageAction(_ item: Item) {
        let url = URL(string: item.image)
        KFManager.fetchImage(from: url) { result in
            guard let image = try? result.get() else { return }
            self.imageRepository.addImage(image: image, fileName: item.productId)
        }
    }
    
    func deleteImageAction(_ item: Item) {
        imageRepository.deleteImage(item.productId)
    }
}



