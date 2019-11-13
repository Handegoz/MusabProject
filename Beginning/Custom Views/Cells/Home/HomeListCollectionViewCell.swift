//
//  HomeListCollectionViewCell.swift
//  Beginning
//
//  Created by Hande on 9/11/19.
//  Copyright © 2019 Hande. All rights reserved.
//

import UIKit

class HomeListCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var subTitleLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    var onButtonTapped:(()->())?
    
        
    var viewModel:TitleCellViewModel!{
        didSet{
            titleLabel.text = viewModel.title
          //  backgroundColor = viewModel.color
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 12
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.darkGray.cgColor
        
        // Initialization code
    }
    @IBAction func onTappedSurveyButton(_ sender: UIButton) {
        onButtonTapped?()

    }
}
