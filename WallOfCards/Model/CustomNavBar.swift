//
//  CustomNavBar.swift
//  WallOfCards
//
//  Created by Richard Price on 29/10/2018.
//  Copyright © 2018 twisted echo. All rights reserved.
//

import UIKit

struct System {
    static func clearNavigationBar(forBar navBar: UINavigationBar) {
        navBar.setBackgroundImage(UIImage(), for: .default)
        navBar.shadowImage = UIImage()
        navBar.isTranslucent = true
    }
}
