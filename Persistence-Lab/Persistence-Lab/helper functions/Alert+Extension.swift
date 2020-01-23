//
//  Alert+Extension.swift
//  Persistence-Lab
//
//  Created by Pursuit on 1/22/20.
//  Copyright © 2020 Pursuit. All rights reserved.
//

//import UIKit
//
//
//// !!! make sure you import UIKit !!!!
//extension UIViewController {
//  func showAlert(title: String, message: String, completion: ((UIAlertAction) -> Void)? = nil) {
//    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
//    let okAction = UIAlertAction(title: "Ok", style: .default, handler: completion)
//    alertController.addAction(okAction)
//    present(alertController, animated: true, completion: nil)
//  }
//}

import UIKit

extension mainViewController{
    func showAlert(title: String, message: String, completion: ((UIAlertAction) -> Void)? = nil ) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "ok", style: .default, handler: completion)
        alertController.addAction(okAction)
        present(alertController, animated:  true, completion: nil)
        }
}
