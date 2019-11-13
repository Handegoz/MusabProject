//
//  SurveyCollectionViewIntroductionCell.swift
//  Beginning
//
//  Created by Hande on 10/29/19.
//  Copyright © 2019 Hande. All rights reserved.
//

import UIKit

class SurveyCollectionViewIntroductionCell: UICollectionViewCell {

    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    
    var viewModel: IntroductionViewModel! {
        didSet {
            titleLabel.text = viewModel.title
            detailLabel.text = viewModel.detail
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
