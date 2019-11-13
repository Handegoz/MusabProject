//
//  SurveyCollectionViewOpenEndCell.swift
//  Beginning
//
//  Created by Hande on 10/29/19.
//  Copyright © 2019 Hande. All rights reserved.
//

import UIKit

class SurveyCollectionViewOpenEndCell: UICollectionViewCell {
    

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerTextView: UITextView! {
        didSet {
            answerTextView.delegate = self
        }
    }
    var onValueChanged:((OpenEndViewModel)->())?
    
    var viewModel: OpenEndViewModel! {
        didSet {
            questionLabel.text = viewModel.question
            if let answer = viewModel.answer {
                answerTextView.text = viewModel.answer
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
extension SurveyCollectionViewOpenEndCell: UITextViewDelegate {
    
    func textViewDidChange(_ textView: UITextView) {
        viewModel.answer = textView.text
        onValueChanged?(viewModel)
    }
    
}
