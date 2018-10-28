//
//  LatestCardsController.swift
//  WallOfCards
//
//  Created by Richard Price on 28/10/2018.
//  Copyright © 2018 twisted echo. All rights reserved.
//

import UIKit

class LatestCardsController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let images = [#imageLiteral(resourceName: "2"), #imageLiteral(resourceName: "4"), #imageLiteral(resourceName: "3"), #imageLiteral(resourceName: "2"), #imageLiteral(resourceName: "2"), #imageLiteral(resourceName: "2"), #imageLiteral(resourceName: "2"), #imageLiteral(resourceName: "2"), #imageLiteral(resourceName: "2"), #imageLiteral(resourceName: "2"), #imageLiteral(resourceName: "2"), #imageLiteral(resourceName: "2"), #imageLiteral(resourceName: "2"), #imageLiteral(resourceName: "2"), #imageLiteral(resourceName: "2"), #imageLiteral(resourceName: "2"),#imageLiteral(resourceName: "2"),#imageLiteral(resourceName: "2"),#imageLiteral(resourceName: "2"),#imageLiteral(resourceName: "2"),#imageLiteral(resourceName: "2"),#imageLiteral(resourceName: "2"),#imageLiteral(resourceName: "2")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        if let layout = collectionView.collectionViewLayout as? PinterestLayout {
//            layout.delegate = self
//        }
        collectionView?.register(LatestCardsCustomCell.self, forCellWithReuseIdentifier: String(describing: LatestCardsCustomCell.self))
        collectionView?.backgroundColor = .white
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {

        return UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (view.frame.width - 3 * 16) / 2
        return CGSize(width: width, height: width + 46)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 16
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: LatestCardsCustomCell.self), for: indexPath) as! LatestCardsCustomCell
        let image = images[indexPath.row]
        cell.cardImageView.image = image
        return cell
    }
    
}
//
//extension LatestCardsController: PinterestLayoutDelegate {
//    func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath: IndexPath) -> CGFloat {
//        let image = images[indexPath.row]
//        let height = image.size.height
//        return height
//
//    }

//}
