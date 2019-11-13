//
//  SettingsCollectionViewCell.swift
//  Beginning
//
//  Created by Hande on 11/7/19.
//  Copyright © 2019 Hande. All rights reserved.
//

import UIKit

class SettingsCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var leftImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var viewModel: SettingsCellViewModel! {
        didSet {
            leftImageView.image = viewModel.leftImage
            titleLabel.text = viewModel.title
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    @IBAction func onTappedSettingButton(_ sender: UIButton) {
        
    }
}
