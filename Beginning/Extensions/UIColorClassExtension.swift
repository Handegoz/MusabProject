//
//  UIColorClassExtension.swift
//  Beginning
//
//  Created by Hande on 9/4/19.
//  Copyright © 2019 Hande. All rights reserved.
//

import UIKit

extension UIColor{
    static func getColor(red:CGFloat, green:CGFloat, blue:CGFloat, alpha:CGFloat = 1.0) -> UIColor{
        return UIColor(red: red / 255.0, green: green / 255.0, blue: blue / 255.0, alpha: alpha)
    }
    
    static let defaultAppColor = #colorLiteral(red: 0.8509803922, green: 0.3921568627, blue: 0.5450980392, alpha: 1)
}

