//
//  ApiService.swift
//  WallOfCards
//
//  Created by Richard Price on 29/10/2018.
//  Copyright © 2018 twisted echo. All rights reserved.
//

import Foundation
import FirebaseDatabase

struct ApiService {
    
    var REF_IMAGES = Database.database().reference().child("MainImages")
    
    func observeImages(withid id: String, completion: @escaping (MainCardsModel) -> Void) {
        REF_IMAGES.child(id).observe(.value) { (snapshot) in
            if let dict = snapshot.value as? [String: Any] {
                let images = MainCardsModel.init()
                let result = images.transformImages(dict: dict, key: snapshot.key)
                completion(result)
            }
        }
    }
    
    func getImages(completion: @escaping (MainCardsModel) -> Void) {
        REF_IMAGES.observeSingleEvent(of: .value) { (snapshot: DataSnapshot) in
            let arraySnap = (snapshot.children.allObjects as! [DataSnapshot]).reversed()
            arraySnap.forEach({ (child) in
                if let dict = child.value as? [String: Any] {
                    let images = MainCardsModel.init()
                    let result = images.transformImages(dict: dict, key: child.key)
                    completion(result)
                }
            })
        }
    }
}
