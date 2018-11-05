//
//  LatestCardsCustomCell.swift
//  WallOfCards
//
//  Created by Richard Price on 28/10/2018.
//  Copyright © 2018 twisted echo. All rights reserved.
//

import UIKit
import SDWebImage

class LatestCardsCustomCell: UICollectionViewCell {
    
    let fireBaseImageView: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 12
        image.layer.masksToBounds = true
        return image
    }()
    
    var images: MainCardsModel? {
        didSet {
            
            if let photoUrlString = images?.photoUrl {
                let photoUrl = URL(string: photoUrlString)
                fireBaseImageView.sd_setImage(with: photoUrl)
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        // backgroundColor = .gray
        //addSubview(cardImageView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
