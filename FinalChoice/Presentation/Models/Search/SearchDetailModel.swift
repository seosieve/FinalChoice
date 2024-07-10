//
//  SearchDetailModel.swift
//  FinalChoice
//
//  Created by 서충원 on 6/17/24.
//

import UIKit
import RealmSwift

final class SearchDetailModel {
    
    var repository = BasketRepository()
    var imageRepository = ImageFileRepository()
    
    private var likeState: Names.ButtonCellStates!
    
    func configureLikeImage(productId: String) -> UIImage {
        let isLiked = UserDefaultManager.isLiked(productId)
        likeState = isLiked ? .selected : .deselected
        let image = isLiked ? Images.like(.selected) : Images.like(.deselected)
        return image
    }
    
    func changeLikeImage(item: Item) -> UIImage {
        likeState.toggleState()
        ///UserDefaults
        likeState == .selected ? UserDefaultManager.addLike(item.productId) : UserDefaultManager.removeLike(item.productId)
        ///Realm + FileManager
        likeState == .selected ? addBasketAction(item) : deleteBasketAction(item)
        return Images.like(likeState)
    }
    
    func addBasketAction(_ item: Item) {
        let productId = item.productId
        let title = item.titleString
        let mallName = item.mallName
        let price = Int(item.lprice) ?? 0
        
        let basket = Basket(productId: productId, title: title, mallName: mallName, price: price)
        
        repository.addObject(object: basket)
        addImageAction(item)
    }
    
    func deleteBasketAction(_ item: Item) {
        let productId = item.productId
        guard let basket = repository.allObjects.first(where: { $0.productId == productId }) else { return }
        
        repository.deleteObject(object: basket)
        deleteImageAction(item)
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
    
