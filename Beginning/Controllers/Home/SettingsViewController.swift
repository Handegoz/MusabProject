//
//  SettingsViewController.swift
//  Beginning
//
//  Created by Hande on 11/7/19.
//  Copyright © 2019 Hande. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    @IBOutlet weak var settingsCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingsCollectionView.register(UINib.init(nibName: "SettingsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SettingsCollectionViewCell")

        settingsCollectionView.dataSource = self
        settingsCollectionView.delegate = self
    }
    
    var settingsArray = [
        SettingsCellViewModel(title: "Kullanıcı Bilgileri", leftImage: nil, identifier: "user_details"),
        SettingsCellViewModel(title: "Şifremi Değiştir", leftImage: nil, identifier: "change_password"),
        SettingsCellViewModel(title: "Önceki Şikayetlerim", leftImage: nil, identifier: "previous_complaints"),
        SettingsCellViewModel(title: "Çıkış Yap", leftImage: nil, identifier: "log_out")
    ]
    
    // MARK: CollectionViewCell Functions

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return settingsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SettingsCollectionViewCell", for: indexPath) as! SettingsCollectionViewCell
        cell.viewModel = settingsArray[indexPath.row]
        cell.onButtonTapped =  {[unowned self] (viewModel) in
            self.foo(viewModel: viewModel)
        }
            return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: settingsCollectionView.frame.width , height: 60)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
    }

    func foo(viewModel: SettingsCellViewModel){
        if viewModel.identifier == "user_details" {
            self.performSegue(withIdentifier:"showUserDetailsSegue", sender: viewModel)
        }
        else if viewModel.identifier == "change_password" {
            self.performSegue(withIdentifier: "showChangePasswordSegue", sender: viewModel)
        }
        else if viewModel.identifier == "previous_complaints" {
            self.performSegue(withIdentifier: "showPreviousComplaintsSegue", sender: viewModel)
    }
    }


}
