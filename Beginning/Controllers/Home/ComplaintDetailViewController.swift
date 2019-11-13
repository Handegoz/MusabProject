//
//  ComplaintDetailViewController.swift
//  Beginning
//
//  Created by Hande on 9/25/19.
//  Copyright © 2019 Hande. All rights reserved.
//

import UIKit

class ComplaintDetailViewController: UIViewController {
    
    @IBOutlet weak var catagoryLabel: UILabel!
    @IBOutlet weak var complaintTitleLabel: UILabel!
    @IBOutlet weak var complaintDetailLabel: UILabel!
    @IBOutlet weak var creationTimeLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var answerTitleLabel: UILabel!
    
    var complaint: ComplaintModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        catagoryLabel.text = complaint?.catagory
        complaintTitleLabel.text = complaint?.title
        complaintDetailLabel.text = complaint?.detail
        stateLabel.text = complaint?.getState()
        answerLabel.text = complaint?.answer
        creationTimeLabel.text = complaint?.creationDate.formatToDate(dateFormat: "dd MMM yyyy,  HH:mm:ss")
        
        if answerLabel.text == nil {
            answerTitleLabel.alpha = 0
        }
        else {
            answerTitleLabel.alpha = 1
            
        }
    }
    

}
