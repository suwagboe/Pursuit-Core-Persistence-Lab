//
//  DetailsViewController.swift
//  Persistence-Lab
//
//  Created by Pursuit on 1/21/20.
//  Copyright © 2020 Pursuit. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var likesLabel: UILabel!
    @IBOutlet weak var tagsLabel: UILabel!
    @IBOutlet weak var viewLabel: UILabel!
   // @IBOutlet weak var titlLabel: UILabel!
    
    //
      @IBOutlet weak var favButton: UIButton!
    
    public var selectedPhoto: AllPhotos!
    
    override func viewDidLoad() {
        super.viewDidLoad()
     configureController()
    }
    
    func configureController(){
        
        guard let photo = selectedPhoto else {
            print("this aint working!!!")
            return
        }
        
        likesLabel.text = "\(String(describing: photo.likes))"
        tagsLabel.text = "You can find these photos if you search for: \(photo.tags)"
        viewLabel.text = "\(photo.views) many people have viewed this photo"
        
        
        imageView.getImage(with: photo.largeImageURL, completion: {
            [weak self] result in
            switch result {
            case .failure:
                DispatchQueue.main.async {
                    self?.imageView.image = UIImage(systemName: "heart.fill")
                }
            case .success(let image):
                DispatchQueue.main.async {
                    self!.imageView.image = image
                }
            }
        })
        
    }
    
    
    @IBAction func addToFavs(_ sender: UIButton) {
        makingAFav()
    }
    

    func makingAFav(){
        // this function adds the favorites
        if selectedPhoto.fav == nil {
            selectedPhoto.fav = "Shaniya"
        } else if selectedPhoto.fav == "Shaniya" {
            // I hope that this will take away the fav..
            selectedPhoto.fav = nil
        }
       // selectedPhoto.fav = "Shaniya"
        print(selectedPhoto.fav)
        
    }
    
   // @IBAction weak var favButton(_ : UIButton){
    
    // addFav()
    
   // }
    


}

