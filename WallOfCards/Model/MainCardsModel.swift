//
//  MainCardsModel.swift
//  WallOfCards
//
//  Created by Richard Price on 29/10/2018.
//  Copyright © 2018 twisted echo. All rights reserved.
//

import Foundation

struct MainCardsModel {
    var id: String?
    var photoUrl: String?
}

extension MainCardsModel {
    func transformImages(dict: [String: Any], key: String) -> MainCardsModel {
        var cards = MainCardsModel()
        cards.id = key
        cards.photoUrl = dict["photoUrl"] as? String
        return cards
    }
}
