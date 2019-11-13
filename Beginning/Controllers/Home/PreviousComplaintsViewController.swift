//
//  PreviousComplaintsViewController.swift
//  Beginning
//
//  Created by Hande on 11/13/19.
//  Copyright © 2019 Hande. All rights reserved.
//

import UIKit

class PreviousComplaintsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    

    @IBOutlet weak var previousComplaintsCollectionView: UICollectionView!
    private let showComplaintDetailSegueIdentifier = "showComplaintDetailSegue"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
         previousComplaintsCollectionView.register(UINib.init(nibName: "HomeListCollectionViewComplaintCell", bundle: nil), forCellWithReuseIdentifier: "HomeListCollectionViewComplaintCell")
        previousComplaintsCollectionView.delegate = self
        previousComplaintsCollectionView.dataSource = self
        previousComplaintsCollectionView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == showComplaintDetailSegueIdentifier {
            let vc = segue.destination as! ComplaintDetailViewController
            vc.complaint = sender as? ComplaintModel
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return AppManager.shared.array[1].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = previousComplaintsCollectionView.dequeueReusableCell(withReuseIdentifier: "HomeListCollectionViewComplaintCell", for: indexPath) as! HomeListCollectionViewComplaintCell
        cell.viewModel = (AppManager.shared.array[1][indexPath.row] as! ComplaintModel)
        cell.onButtonTapped = {[unowned self] (viewModel) in
            
            self.performSegue(withIdentifier: self.showComplaintDetailSegueIdentifier, sender: viewModel)
        }
        // self.performSegue(withIdentifier: "showComplaintDetailSegue", sender: viewModel)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize (width: previousComplaintsCollectionView.frame.width - 80.0, height: 100)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15.0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    }
    

}
