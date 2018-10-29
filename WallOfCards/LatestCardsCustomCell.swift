//
//  LatestCardsCustomCell.swift
//  WallOfCards
//
//  Created by Richard Price on 28/10/2018.
//  Copyright © 2018 twisted echo. All rights reserved.
//

import UIKit

class LatestCardsCustomCell: UICollectionViewCell {
    
    let cardImageView: UIImageView = {
        let iv = UIImageView()
        iv.layer.cornerRadius = 16
        iv.clipsToBounds = true
        return iv
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
       // backgroundColor = .gray
        addSubview(cardImageView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
