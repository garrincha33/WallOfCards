//
//  MainImagesAPI.swift
//  WallOfCards
//
//  Created by Richard Price on 30/10/2018.
//  Copyright © 2018 twisted echo. All rights reserved.
//

import Foundation
import FirebaseDatabase

class MainImagesAPI {
    
    var MY_MAIN_IMAGES = Database.database().reference().child("MainImages")
    
}
