//
//  LatestCardsController.swift
//  WallOfCards
//
//  Created by Richard Price on 28/10/2018.
//  Copyright © 2018 twisted echo. All rights reserved.
//

import UIKit
import TRMosaicLayout
import FirebaseDatabase

class LatestCardsController: UICollectionViewController {
    
    let images = [#imageLiteral(resourceName: "9"), #imageLiteral(resourceName: "7"), #imageLiteral(resourceName: "6"), #imageLiteral(resourceName: "9"), #imageLiteral(resourceName: "7"), #imageLiteral(resourceName: "6"), #imageLiteral(resourceName: "8"), #imageLiteral(resourceName: "9"), #imageLiteral(resourceName: "7"), #imageLiteral(resourceName: "6"), #imageLiteral(resourceName: "8"), #imageLiteral(resourceName: "9"), #imageLiteral(resourceName: "7"), #imageLiteral(resourceName: "6"), #imageLiteral(resourceName: "8")]
    var firebaseImages: [MainCardsModel] = []
     
    var REF_IMAGES = Database.database().reference().child("MainImages")
    
    override func viewDidLoad() {
        super.viewDidLoad()
     if let navController = navigationController {
          System.clearNavigationBar(forBar: navController.navigationBar)
          navController.view.backgroundColor = .clear
     }
     
     loadImages()
     

        let mosaicLayout = TRMosaicLayout()
        self.collectionView?.collectionViewLayout = mosaicLayout
        mosaicLayout.delegate = (self as TRMosaicLayoutDelegate)
        //transparentNavBar()
        collectionView?.register(LatestCardsCustomCell.self, forCellWithReuseIdentifier: String(describing: LatestCardsCustomCell.self))
        collectionView?.backgroundColor = UIColor.rgb(red: 26, green: 15, blue: 63)
    }
     
     private func loadImages() {
          Api.User.getImages { (images) in
               
               print("results from complettion")
               print(images.photoUrl ?? "")
              
          }
     }

     
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
     let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: LatestCardsCustomCell.self), for: indexPath) as! LatestCardsCustomCell
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
        return UIEdgeInsets(top: 6, left: 6, bottom: 6, right: 6)
    }
    
    func heightForSmallMosaicCell() -> CGFloat {
        return 150
    }
}
