//
//  ComplaintModel.swift
//  Beginning
//
//  Created by Hande on 9/25/19.
//  Copyright © 2019 Hande. All rights reserved.
//

import UIKit
struct ComplaintModel {
    let id: Int
    let catagory: String
    let title: String
    let detail: String
    let answer: String?
    let state: Int
    let creationDate: Date
    
    func getState () -> String {
        
        if self.state == 0 {
            return "Durum: Bekleniyor"
        }
        else if self.state == 1 {
            return "Durum: Okundu"
        }
        else  {
            return "Durum: Yanıtlandı"
        }
    }
    
    
}
