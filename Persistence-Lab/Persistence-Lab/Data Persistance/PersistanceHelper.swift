//
//  PersistanceHelper.swift
//  Persistence-Lab
//
//  Created by Pursuit on 1/21/20.
//  Copyright © 2020 Pursuit. All rights reserved.
//

import Foundation

enum DataPersistenceError: Error {
    
    case savingError(Error)
    case fileDoesNotExist(String)
    case decodingError(Error)
    case noData
}

class PersistenceHelper {
    
    private var photosArray = [AllPhotos]()
        // want to save the favorite photos with the persistence helper
    
    private var filename: String
            //= "Favs.plist"
    init(filename:String){
        self.filename = filename
    }
    

    private func saveRegardless() throws{
        do {
            //
             let url = FileManager.pathToDocumentsDirectory(with: filename)

            let data = try PropertyListEncoder().encode(filename)
            // property list encode is to convert the data
            try data.write(to: url, options: .atomic)
        } catch {
            throw DataPersistenceError.savingError(error)
        }
    }
    
    public func saveToFavs(photo: AllPhotos) throws {
      //  let url = FileManager.pathToDocumentsDirectory(with: filename)

        // it has the parameter of a photo because its what needs to be passed in order for it to save
        //
        // need to create(save) something in order to save something.. so you need to create the saved have have it somewhere before you actually save the item to the folders.. cant save something that isnt there.
        photosArray.append(photo)
        
        // cant create something from nothing
        do {
            try saveRegardless()
        } catch {
            throw DataPersistenceError.savingError(error)
        }
        
    }
    
    public func loadFavorites() throws -> [AllPhotos] {
        let url = FileManager.pathToDocumentsDirectory(with: filename)

        // url comes from the static let from above
        let path = url.path

        if FileManager.default.fileExists(atPath: path) {
            
            if let data = FileManager.default.contents(atPath: path) {
                do {
                    photosArray = try PropertyListDecoder().decode([AllPhotos].self, from: data)
                } catch {
                    throw DataPersistenceError.decodingError(error)
                }
            }
            else {
                throw DataPersistenceError.noData
            }
            
        }else {
            throw DataPersistenceError.fileDoesNotExist(path)
        }
        return photosArray
        
    }
    
    
    
}
