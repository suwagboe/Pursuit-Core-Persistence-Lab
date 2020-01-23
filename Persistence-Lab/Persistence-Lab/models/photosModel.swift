//
//  photosModel.swift
//  Persistence-Lab
//
//  Created by Pursuit on 1/21/20.
//  Copyright © 2020 Pursuit. All rights reserved.
//

import Foundation

struct Photos: Codable {
    var hits: [AllPhotos]
}

struct AllPhotos: Codable {
    var likes: Int
   var views: Int
    var tags: String
    var largeImageURL: String
    var fav: String?
    var userImageURL: String
}
