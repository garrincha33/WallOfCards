//
//  LatestCardsController.swift
//  WallOfCards
//
//  Created by Richard Price on 28/10/2018.
//  Copyright © 2018 twisted echo. All rights reserved.
//

import UIKit
import SimpleImageViewer
import TRMosaicLayout


class LatestCardsController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
     
     var firebaseImages: [MainCardsModel] = []

     override func viewDidLoad() {
          super.viewDidLoad()
          
          if let navController = navigationController {
               System.clearNavigationBar(forBar: navController.navigationBar)
               navController.view.backgroundColor = .clear
          }
          loadImages()
          setupMoziac()
     }
     
     private func setupMoziac() {
          let mosaicLayout = TRMosaicLayout()
          self.collectionView?.collectionViewLayout = mosaicLayout
          mosaicLayout.delegate = (self as TRMosaicLayoutDelegate)
          //transparentNavBar()
          collectionView?.register(LatestCardsCustomCell.self, forCellWithReuseIdentifier: String(describing: LatestCardsCustomCell.self))
          collectionView?.backgroundColor = UIColor.rgb(red: 26, green: 15, blue: 63)
     }
     
     private func loadImages() {
          Api.User.getImages { (images) in
               DispatchQueue.main.async {
                    self.firebaseImages.append(images)
                    self.collectionView.reloadData()
               }
          }
     }
     
     
     override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
          return firebaseImages.count
     }
     
     override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
          let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: LatestCardsCustomCell.self), for: indexPath) as! LatestCardsCustomCell
          let image = firebaseImages[indexPath.row]
          let imageView = cell.fireBaseImageView
          cell.images = image
          imageView.contentMode = .scaleToFill
          //imageView.image = image
          //imageView.frame = cell.frame
          cell.backgroundView = imageView
          return cell
     }
     
     override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
          let cell = collectionView.cellForItem(at: indexPath) as! LatestCardsCustomCell
          let configuration = ImageViewerConfiguration { config in
               config.imageView = cell.fireBaseImageView
          }
          present(ImageViewerController(configuration: configuration), animated: true)
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
