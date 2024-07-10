//
//  RealmManager.swift
//  FinalChoice
//
//  Created by 서충원 on 7/10/24.
//

import Foundation
import RealmSwift

final class RealmManager {
    static let shared = RealmManager()
    
    private init() { }
    
    var realm: Realm {
        do {
            return try Realm()
        } catch let error as NSError {
            fatalError("Error initializing Realm: \(error.localizedDescription)")
        }
    }
}
