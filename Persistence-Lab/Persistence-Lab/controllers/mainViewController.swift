//
//  ViewController.swift
//  Persistence-Lab
//
//  Created by Pursuit on 1/21/20.
//  Copyright © 2020 Pursuit. All rights reserved.
//

import UIKit

class mainViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    

    @IBOutlet weak var collectionView: UICollectionView!
    
    private var allPhotos = [AllPhotos](){
        didSet {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        searchBar.delegate = self
        collectionView.delegate = self
        collectionView.dataSource = self
        searchAndGetPhotos(searchQuery: "sky")
        
    }

    func searchAndGetPhotos(searchQuery: String){
        
        PhotosAPIClient.getPhotos(searchQuery: searchQuery, completion: {
            [weak self] result in
            switch result {
            case .failure(let appError):
                DispatchQueue.main.async {
                    self?.showAlert(title: "Image fail", message: "unable to get the images: \(appError)")
                }
            case .success(let images):
                self?.allPhotos = images
            }
            
        })
        
    }
    
}


extension mainViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String){
        guard let searchText = searchBar.text else {
            print("we are missing text")
            return // we are returning because we are inside of a guard let statement
        }}
    func searchBarButtonClicked(_ searchBar: UISearchBar){
        searchBar.resignFirstResponder()
    }
}


extension mainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allPhotos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as? PhotoCell else {
            fatalError("double check the cell and make sure it is sured correctly.")
        }
        
        let photo = allPhotos[indexPath.row]
        cell.configureCell(with: photo.largeImageURL)
        return cell
    }
}

//extension mainViewController: UICollection

extension mainViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let interItemSpacing = 10
        let maxWidth = UIScreen.main.bounds.size.width
        let numberOfItem: CGFloat = 3
        let totalSpacing: CGFloat = numberOfItem * CGFloat(interItemSpacing)
        let itemWidth = (maxWidth - totalSpacing) / numberOfItem
        return CGSize(width: itemWidth, height: itemWidth)
        // gets the size of the cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }
}


