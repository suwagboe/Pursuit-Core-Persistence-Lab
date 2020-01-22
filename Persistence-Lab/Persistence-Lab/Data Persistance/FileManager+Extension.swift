//
//  FileManager+Extension.swift
//  Persistence-Lab
//
//  Created by Pursuit on 1/21/20.
//  Copyright © 2020 Pursuit. All rights reserved.
//

import Foundation

extension FileManager {
    
    static func getDocumentsDirectory() -> URL{
        
    return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        // this only gives access to the location inside of the device.
        // fileManager gives access to files..
        // access to documentsDirectory
        // [0] says to make a new folder
        // gives you your own seperate location
        
    }
    
    static func pathToDocumentsDirectory(with filename: String) -> URL {
        
        
        
        return getDocumentsDirectory().appendingPathComponent(filename)
        
        // you give it the parameter because this allows for when the function is used and called that the on entered is the one that ends up being the name... 
        
        
    }
    
    
    
    
}



