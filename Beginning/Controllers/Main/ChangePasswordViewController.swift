//
//  ChangePasswordViewController.swift
//  Beginning
//
//  Created by Hande on 9/6/19.
//  Copyright © 2019 Hande. All rights reserved.
//

import UIKit

class ChangePasswordViewController: UIViewController {
    
    
    @IBOutlet weak var timerLabel: UILabel!
    
    var timer:Timer?
    var seconds = 60
    var phoneNumber:String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create timer
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerElapsed), userInfo: nil, repeats: true)
    }
    
    @objc func timerElapsed () {
        
        seconds -= 1
        
        // Set label
        timerLabel.text = "Kalan zaman: \(seconds)"
        
        // When the timer has reached 0..
        if seconds <= 0 {
            
            // Stop the timer
            timer?.invalidate()
            timerLabel.textColor = UIColor.red
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
