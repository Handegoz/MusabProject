//
//  Date+Extension.swift
//  Beginning
//
//  Created by Hande on 9/25/19.
//  Copyright © 2019 Hande. All rights reserved.
//

import Foundation

extension Date {
    func formatToDate (dateFormat:String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        return dateFormatter.string(from: self)
    }
}
