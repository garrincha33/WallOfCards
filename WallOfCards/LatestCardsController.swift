//
//  LatestCardsController.swift
//  WallOfCards
//
//  Created by Richard Price on 28/10/2018.
//  Copyright © 2018 twisted echo. All rights reserved.
//

import UIKit
import TRMosaicLayout

class LatestCardsController: UICollectionViewController {
    
    let images = [#imageLiteral(resourceName: "9"), #imageLiteral(resourceName: "7"), #imageLiteral(resourceName: "6"), #imageLiteral(resourceName: "9"), #imageLiteral(resourceName: "7"), #imageLiteral(resourceName: "6"), #imageLiteral(resourceName: "8"), #imageLiteral(resourceName: "9"), #imageLiteral(resourceName: "7"), #imageLiteral(resourceName: "6"), #imageLiteral(resourceName: "8"), #imageLiteral(resourceName: "9"), #imageLiteral(resourceName: "7"), #imageLiteral(resourceName: "6"), #imageLiteral(resourceName: "8")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let mosaicLayout = TRMosaicLayout()
        self.collectionView?.collectionViewLayout = mosaicLayout
        mosaicLayout.delegate = (self as TRMosaicLayoutDelegate)
        //transparentNavBar()
        collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: String(describing: UICollectionViewCell.self))
        collectionView?.backgroundColor = UIColor.rgb(red: 26, green: 15, blue: 63)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
//    override func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return 1
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//
//        return UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
//
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let width = (view.frame.width - 3 * 16) / 2
//        return CGSize(width: width, height: width + 46)
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//
//        return 16
//
//    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
     let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: UICollectionViewCell.self), for: indexPath)
          let image = images[indexPath.row]
          let imageView = UIImageView()
          imageView.image = image
          imageView.frame = cell.frame
          cell.backgroundView = imageView
        return cell
    }
    
    fileprivate func transparentNavBar() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
    }
    
}

extension LatestCardsController: TRMosaicLayoutDelegate {
    
    func collectionView(_ collectionView:UICollectionView, mosaicCellSizeTypeAtIndexPath indexPath:IndexPath) -> TRMosaicCellType {
        // I recommend setting every third cell as .Big to get the best layout
        return indexPath.item % 3 == 0 ? TRMosaicCellType.big : TRMosaicCellType.small
    }
    
    func collectionView(_ collectionView:UICollectionView, layout collectionViewLayout: TRMosaicLayout, insetAtSection:Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
    }
    
    func heightForSmallMosaicCell() -> CGFloat {
        return 150
    }
}
