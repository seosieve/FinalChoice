//
//  BasketRepository.swift
//  FinalChoice
//
//  Created by 서충원 on 7/10/24.
//

import Foundation
import RealmSwift

final class BasketRepository {
    
    private let realm = RealmManager.shared.realm
    
    lazy var fileURL = realm.configuration.fileURL
    lazy var allObjects = realm.objects(Basket.self)
    
    func addObject(object: Basket) {
        do {
            try realm.write {
                realm.add(object)
                print("Add Completed")
            }
        } catch {
            print("Error Add Realm Object: \(error.localizedDescription)")
        }
    }
    
    func deleteObject(object: Basket) {
        do {
            try realm.write {
                realm.delete(object)
                print("Delete Completed")
            }
        } catch {
            print("Error Delete Realm Object: \(error.localizedDescription)")
        }
    }
}
