//
//  KingFisherManager.swift
//  FinalChoice
//
//  Created by 서충원 on 7/10/24.
//

import UIKit
import Kingfisher

class KFManager {
    static func fetchImage(from url: URL?, completion: @escaping (UIImage?, Error?) -> Void) {
        KingfisherManager.shared.retrieveImage(with: url!) { result in
            switch result {
            case .success(let value):
                completion(value.image, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
}
