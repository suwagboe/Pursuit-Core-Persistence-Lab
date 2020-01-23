//
//  FavsViewController.swift
//  Persistence-Lab
//
//  Created by Pursuit on 1/21/20.
//  Copyright © 2020 Pursuit. All rights reserved.
//

import UIKit

class FavsViewController: UIViewController {

    @IBOutlet weak var favscollectionView: UICollectionView!

     
    
    public var favPhoto = [AllPhotos]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    //  favscollectionView.delegate = self
        //favscollectionView.dataSource = self
    }


}

extension DetailsViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //favPhoto.count 
        return 0
    }
    
    
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    // the downcast should not be with the photoCell
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "favsCell", for: indexPath) as? PhotoCell else {
        fatalError("cell doesnt work ")
    }
    
    
    return cell 
    }
    
}

extension DetailsViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let interItemSpacing = 10
        let maxWidth = UIScreen.main.bounds.size.width
        let numberOfItem: CGFloat = 3
        let totalSpacing: CGFloat = numberOfItem * CGFloat(interItemSpacing)
        let itemWidth = (maxWidth - totalSpacing) / numberOfItem
        return CGSize(width: itemWidth, height: itemWidth)
    }
    
    

    
}

