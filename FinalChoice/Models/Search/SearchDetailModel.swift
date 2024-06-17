//
//  SearchDetailModel.swift
//  FinalChoice
//
//  Created by 서충원 on 6/17/24.
//

import UIKit

class SearchDetailModel {
    private var likeState: ButtonCellStates!
    
    func configureLikeImage(productId: String) -> UIImage {
        let isLiked = UserDefaultManager.isLiked(productId)
        likeState = isLiked ? .selected : .deselected
        let image = isLiked ? Images.like(.selected) : Images.like(.deselected)
        return image
    }
    
    func changeLikeImage(productId: String) -> UIImage {
        likeState.toggleState()
        likeState == .selected ? UserDefaultManager.addLike(productId) : UserDefaultManager.removeLike(productId)
        return Images.like(likeState)
    }
}
    
