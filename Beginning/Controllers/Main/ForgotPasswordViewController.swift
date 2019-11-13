//
//  ForgotPasswordViewController.swift
//  Beginning
//
//  Created by Hande on 9/5/19.
//  Copyright © 2019 Hande. All rights reserved.
//

import UIKit

class ForgotPasswordViewController: UIViewController {

    @IBOutlet weak var phoneNoTextField: TextFieldView!
    
    private let changePasswordSegueIdentifier = "showChangePasswordSegue"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        phoneNoTextField.textField.keyboardType = UIKeyboardType.numberPad
       
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == changePasswordSegueIdentifier{
            let vc = segue.destination as! ChangePasswordViewController
            vc.phoneNumber = sender as? String
        }
    }

    @IBAction func onLoginButtonTapped(_ sender: UIButton) {
        
        if phoneNoTextField.textField.text?.count != 11 {
            
        showAlert("Uyarı!", "Lütfen telefon numaranızı eksizsiz giriniz")
            
        }
        else {
            performSegue(withIdentifier: changePasswordSegueIdentifier, sender: phoneNoTextField.textField.text)
            

        }

    }
    
}
