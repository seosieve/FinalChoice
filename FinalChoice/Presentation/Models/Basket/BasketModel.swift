//
//  BasketModel.swift
//  FinalChoice
//
//  Created by 서충원 on 7/10/24.
//

import UIKit
import RealmSwift

final class BasketModel {
    
    private var repository = BasketRepository()
    var imageRepository = ImageFileRepository()
    
    lazy var result: Results<Basket> = repository.allObjects
    
    func loadImage(fileName: String) -> UIImage {
        return imageRepository.loadImage(fileName: fileName) ?? UIImage()
    }
    
    func deleteBasketAction(_ index: Int) {
        let productId = result[index].productId
        guard let basket = repository.allObjects.first(where: { $0.productId == productId }) else { return }
        ///UserDefaults
        UserDefaultManager.removeLike(productId)
        ///Realm + FileManager
        repository.deleteObject(object: basket)
        deleteImageAction(productId)
    }
    
    func deleteImageAction(_ productId: String) {
        imageRepository.deleteImage(productId)
    }
}
