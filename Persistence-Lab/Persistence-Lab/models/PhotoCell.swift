//
//  PhotoCellCollectionViewCell.swift
//  Persistence-Lab
//
//  Created by Pursuit on 1/22/20.
//  Copyright © 2020 Pursuit. All rights reserved.
//

import UIKit
import ImageKit


class PhotoCell: UICollectionViewCell {
    
    @IBOutlet weak var photosImage: UIImageView!
      
     
    
    // what is the reason that for public being placed in front of the function..
   public func configureCell(with photos: String){
        
        // what does this even mean???
        photosImage.getImage(with: photos) { [weak self] (result) in
            switch result {
            case .failure:
                DispatchQueue.main.async {
                    self?.photosImage.image = UIImage(systemName: "exclamationmark.triangle")
                }
            case .success(let image):
                DispatchQueue.main.async {
                    self?.photosImage.image = image
                }
                
            }
            
            
        }
        
    }
    
}
