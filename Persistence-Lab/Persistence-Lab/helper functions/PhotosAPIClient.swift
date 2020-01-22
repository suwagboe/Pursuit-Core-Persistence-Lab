//
//  PhotosAPIClient.swift
//  Persistence-Lab
//
//  Created by Pursuit on 1/21/20.
//  Copyright © 2020 Pursuit. All rights reserved.
//

import Foundation
import NetworkHelper

class PhotosAPIClient {
    
    func getPhotos(with string: String, completion: @escaping (Result <[AllPhotos], AppError>) -> () ) {
        
        let photosUrlEndpoint = ""
        
        guard let url = URL(string: photosUrlEndpoint) else {
            completion(.failure(.badURL(photosUrlEndpoint)))
            return
        }

        let request = URLRequest(url: url)
        
        NetworkHelper.shared.performDataTask(with: request, completion: {
          result in
            switch result {
                case .failure(let error):
                    completion(.failure(.networkClientError(error)))
                case .success(let data):
                    do{
                        // without the do catch the data is not properly captured
                        let photosData = try JSONDecoder().decode([Photos].self, from: data)
                        
                        completion(.success(photosData.first!.hits))

                    } catch {
                        completion(.failure(.decodingError(error)))
                }
            }
        })
        
        
    }
    
    
}

