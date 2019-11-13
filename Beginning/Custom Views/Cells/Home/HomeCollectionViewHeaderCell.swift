//
//  HomeCollectionViewHeaderCell.swift
//  Beginning
//
//  Created by Hande on 9/13/19.
//  Copyright © 2019 Hande. All rights reserved.
//

import UIKit

class HomeCollectionViewHeaderCell: UICollectionReusableView {
    
    @IBOutlet weak var headerTitleLabel: UILabel!
    
    var header:String? {
        didSet {
         headerTitleLabel.text = header 
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
//    public func configure(with header: String) {
//        
//        headerTitleLabel.text = header
//        
//    }


}
