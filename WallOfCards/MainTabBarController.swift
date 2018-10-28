//
//  MainTabBarController.swift
//  WallOfCards
//
//  Created by Richard Price on 28/10/2018.
//  Copyright © 2018 twisted echo. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .blue
        tabBar.tintColor = .purple
        UINavigationBar.appearance().prefersLargeTitles = true
        
        
        let layout = UICollectionViewFlowLayout()
        let latestCardsController = LatestCardsController(collectionViewLayout: layout)
        
        viewControllers = [

            setupNavControllers(with: latestCardsController, title: "Latest Cards", image: #imageLiteral(resourceName: "home_selected")),
            setupNavControllers(with: ViewController(), title: "Favourites", image: #imageLiteral(resourceName: "prices_new"))
        ]
    }
    
    private func setupUI() {
        
    }
    
    private func setupNavControllers(with rootViewController: UIViewController, title: String, image: UIImage) -> UIViewController {
        
        let navController = UINavigationController(rootViewController: rootViewController)
        rootViewController.title = title
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        return navController
        
        
    }
    
    
}
