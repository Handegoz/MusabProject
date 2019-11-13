//
//  TextFieldView.swift
//  Beginning
//
//  Created by Hande on 9/2/19.
//  Copyright © 2019 Hande. All rights reserved.
//

import UIKit

@IBDesignable class TextFieldView: UIView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var lineView: UIView!
    @IBOutlet weak var textFieldTitleLabel: UILabel!
    
    @IBOutlet weak var textFieldTitleLabelHeight: NSLayoutConstraint!
    
    
    @IBInspectable var placeholder:String?{
        get{
            return textField.placeholder
        }set{
            if textField != nil{
                textField.placeholder = newValue
                textFieldTitleLabel.text = newValue
            }
        }
    }
    
    @IBInspectable var isSecureEntry:Bool{
        get{
            return textField.isSecureTextEntry
        }set{
            self.textField.isSecureTextEntry = newValue
        }
    }
    
//    @IBInspectable var keyboardType:Int {
//        get{
//            return (textField?.keyboardType)!.rawValue
//
//        }set{
//            if textField != nil{
//                textField.placeholder = newValue
//                textFieldTitleLabel.text = newValue
//            }
//        }
//    }
    

    
    @IBInspectable var textFieldActiveColor:UIColor = UIColor.defaultAppColor
    @IBInspectable var textFieldInactiveColor:UIColor = UIColor.lightGray
    
    override init (frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        let bundle = Bundle(for: TextFieldView.self)
        bundle.loadNibNamed("TextFieldView", owner: self, options: nil)
        contentView.fixInView(self)
    }
    
    func updateTextFieldLabel (height:CGFloat) {
        
        textFieldTitleLabelHeight.constant = height
        
        UIView.animate(withDuration: 0.3, delay: 0, options: UIView.AnimationOptions.transitionCrossDissolve, animations: {[weak self] in
            self?.layoutIfNeeded()
            }, completion: nil)
        
    }

    @IBAction func onBeginEditingTextField(_ sender: UITextField) {
        
        updateTextFieldLabel(height: 20)
        sender.placeholder = nil

        // Change the lineView color
        lineView.backgroundColor = textFieldActiveColor
        
        // Change the title label color
        textFieldTitleLabel.textColor = textFieldActiveColor
        
    }
    @IBAction func onChangedTextField(_ sender: UITextField) {
      
        //TO-DO

    }
    
    @IBAction func onEndEditingTextField(_ sender: UITextField) {
        
        // Change the lineView color to gray
        lineView.backgroundColor = textFieldInactiveColor
        
        // Change the title color to gray 
        textFieldTitleLabel.textColor = textFieldInactiveColor
        
        sender.placeholder = textFieldTitleLabel.text
        
        if sender.text == ""{

            updateTextFieldLabel(height: 0)
        }

    }
    
}

