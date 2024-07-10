//
//  KingFisherManager.swift
//  FinalChoice
//
//  Created by 서충원 on 7/10/24.
//

import UIKit
import Kingfisher

class KFManager {
    static func fetchImage(from url: URL?, completion: @escaping (Result<UIImage, Error>) -> Void) {
        guard let url else { completion(.failure(NSError(domain: "Invalid URL", code: 0))); return }
        
        KingfisherManager.shared.retrieveImage(with: url) { result in
            switch result {
            case .success(let value):
                completion(.success(value.image))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
