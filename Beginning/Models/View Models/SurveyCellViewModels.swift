//
//  SurveyCellViewModels.swift
//  Beginning
//
//  Created by Hande on 10/29/19.
//  Copyright © 2019 Hande. All rights reserved.
//

import UIKit
class IntroductionViewModel {
    
    var title: String
    var detail: String
    
    init(title: String, detail: String) {
        self.title = title
        self.detail = detail
    }
}

class OpenEndViewModel {
    var question: String
    var answer: String?
    
    init(question: String, answer: String?) {
        self.question = question
        self.answer = answer
    }
}

class ScaleCellViewModel {
    var question: String
    var answer: Int? = 3
    
    init (question: String, answer: Int?) {
        self.question = question
        self.answer = answer
    }
}


