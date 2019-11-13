//
//  SurveyCollectionViewScaleCell.swift
//  Beginning
//
//  Created by Hande on 10/29/19.
//  Copyright © 2019 Hande. All rights reserved.
//

import UIKit

class SurveyCollectionViewScaleCell: UICollectionViewCell {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerSlider: UISlider! {
        didSet {
            
        }
    }
    var onValueChanged:((ScaleCellViewModel)->())?

    var viewModel: ScaleCellViewModel! {
        didSet {
            questionLabel.text = viewModel.question
            if let answer = viewModel.answer {
                answerSlider.value = Float(answer)
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBAction func onSliderValueChanged(_ sender: UISlider) {
        onValueChanged?(viewModel)
        print(sender.value)
    }
    
}
