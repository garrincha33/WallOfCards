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
        iv.contentMode = .scaleAspectFill
        //iv.backgroundColor = .red
        iv.clipsToBounds = true
        return iv
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .gray
        addSubview(cardImageView)
        cardImageView.anchor(top: safeAreaLayoutGuide.topAnchor, left: safeAreaLayoutGuide.leftAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 163, height: 210)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
