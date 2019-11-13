//
//  UIAlertControllerExtension.swift
//  Beginning
//
//  Created by Hande on 9/9/19.
//  Copyright © 2019 Hande. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {

    func showAlert(_ title:String, _ message:String) {
    
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
    
    alert.addAction(alertAction)
        self.present(alert, animated: true, completion: nil)

}
    
}
