//
//  CustomTabBarController.swift
//  Beginning
//
//  Created by Hande on 9/26/19.
//  Copyright © 2019 Hande. All rights reserved.
//

import UIKit

class CustomTabBarController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if viewController.isKind(of: AddComplaintNavigationViewController.self) {
            let vc = UIViewController.getViewController("Home", "AddComplaintNavigationViewController") as! AddComplaintNavigationViewController
           vc.modalPresentationStyle = .overFullScreen
            
            if let first = (self.viewControllers?.first as? UINavigationController)?.viewControllers.first as? HomeViewController,
                let addComplaintViewController = vc.viewControllers.first as? AddComplaintViewController{
                addComplaintViewController.delegate = first
                self.present(vc, animated: true, completion: nil)
            }
            return false
            
        }
        return true

    }
    

}
