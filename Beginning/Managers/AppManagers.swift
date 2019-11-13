//
//  AppManagers.swift
//  Beginning
//
//  Created by Hande on 10/6/19.
//  Copyright © 2019 Hande. All rights reserved.
//

import Foundation
class AppManager{
    static let shared = AppManager()
    var array: [[Any]] = [
        [TitleCellViewModel(color: .red, title: "bir"), TitleCellViewModel(color: .purple, title: "iki"),
         TitleCellViewModel(color: .gray, title: "üç"),TitleCellViewModel(color: .red, title: "bir"),
         TitleCellViewModel(color: .purple, title: "dört"), TitleCellViewModel(color: .gray, title: "beş"),
         TitleCellViewModel(color: .red, title: "altı"), TitleCellViewModel(color: .purple, title: "yedi"),
         TitleCellViewModel(color: .gray, title: "sekiz")],
        [ComplaintModel(id: 12345, catagory: "Ulaşım", title: "Bahçeli Servisi", detail: "kalabalık", answer: nil, state: 0, creationDate: Date().addingTimeInterval(-1 * 24 * 60 * 60)),
         ComplaintModel(id: 6789, catagory: "Yemek", title: "Patlıcan", detail: "kötü", answer:"tamam", state: 1, creationDate: Date() )]
    ]
}
