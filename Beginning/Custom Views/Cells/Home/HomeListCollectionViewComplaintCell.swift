//
//  HomeListCollectionViewComplaintCell.swift
//  Beginning
//
//  Created by Hande on 9/17/19.
//  Copyright © 2019 Hande. All rights reserved.
//

import UIKit

class HomeListCollectionViewComplaintCell: UICollectionViewCell {
    
    @IBOutlet weak var subjectLabel: UILabel!
    
    @IBOutlet weak var catagoryLabel: UILabel!
    
    @IBOutlet weak var stateLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    var onButtonTapped:((ComplaintModel)->())?
    
    var viewModel:ComplaintModel!{
        didSet{
            subjectLabel.text = viewModel.title
            catagoryLabel.text = "Kategori: \(viewModel.catagory)"
            dateLabel.text = viewModel.creationDate.formatToDate(dateFormat: "dd MMM yyyy")
            stateLabel.text = viewModel.getState()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.cornerRadius = 12
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.darkGray.cgColor
            }

    
    @IBAction func onTappedComplaintButton(_ sender: UIButton) {
        onButtonTapped?(viewModel)
    }
    
}
