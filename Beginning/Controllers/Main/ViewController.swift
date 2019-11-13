//
//  ViewController.swift
//  Beginning
//
//  Created by Hande on 9/2/19.
//  Copyright © 2019 Hande. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var forgotMyPassword: UIButton!
    
    @IBOutlet weak var usernameTextField: TextFieldView!
    
    @IBOutlet weak var passwordTextField: TextFieldView!
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var logoImageView: UIImageView!
    
    
    deinit {
        print("\(self) is deinitialized")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginButton.layer.cornerRadius = 10
        // Do any additional setup after loading the view.
    }
    

    @IBAction func onLoginButtonTapped(_ sender: UIButton) {
        
     
        if usernameTextField.textField.text == "" || passwordTextField.textField.text == "" {

            showAlert("Uyarı!", "Hatalı ya da eksik giriş yaptınız")

        }
        else {
            
            let controller = UIViewController.getViewController("Home", "HomeTabBarViewController")
        
            UIViewController.changeRootViewController(controller)
            
        }
    }
}
