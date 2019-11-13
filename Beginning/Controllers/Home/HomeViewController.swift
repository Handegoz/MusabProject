//
//  HomeViewController.swift
//  Beginning
//
//  Created by Hande on 9/10/19.
//  Copyright © 2019 Hande. All rights reserved.
//

import UIKit

protocol AddComplaintDelegate {
    func addComplaintToList ()
}

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, AddComplaintDelegate {
    
    @IBOutlet weak var homeCollectionView: UICollectionView!
    
    
    let headerArray = ["Bekleyen anketler", "Şikayetler"]
    
//    var array: [[Any]] = [
//        [TitleCellViewModel(color: .red, title: "bir"), TitleCellViewModel(color: .purple, title: "iki"),
//         TitleCellViewModel(color: .gray, title: "üç"),TitleCellViewModel(color: .red, title: "bir"),
//         TitleCellViewModel(color: .purple, title: "dört"), TitleCellViewModel(color: .gray, title: "beş"),
//         TitleCellViewModel(color: .red, title: "altı"), TitleCellViewModel(color: .purple, title: "yedi"),
//         TitleCellViewModel(color: .gray, title: "sekiz"),TitleCellViewModel(color: .red, title: "dokyuz"),
//         TitleCellViewModel(color: .purple, title: "on"), TitleCellViewModel(color: .gray, title: "on bir")],
//        [ComplaintModel(id: 12345, catagory: "Ulaşım", title: "Bahçeli Servisi", detail: "kalabalık", answer: nil, state: 0, creationDate: Date().addingTimeInterval(-1 * 24 * 60 * 60)),
//         ComplaintModel(id: 6789, catagory: "Yemek", title: "Patlıcan", detail: "kötü", answer:"tamam", state: 1, creationDate: Date() )]
//    ]
    
    private let showComplaintDetailSegueIdentifier = "showComplaintDetailSegue"
    private let showSurveyDetailSegueIdentifier = "showSurveyDetailSegue"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeCollectionView.dataSource = self
        homeCollectionView.delegate = self
        homeCollectionView.register(UINib.init(nibName: "HomeListCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "HomeListCollectionViewCell")
        homeCollectionView.register(UINib.init(nibName: "HomeListCollectionViewComplaintCell", bundle: nil), forCellWithReuseIdentifier: "HomeListCollectionViewComplaintCell")
        homeCollectionView.register(UINib(nibName: "HomeCollectionViewHeaderCell", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier:"HomeCollectionViewHeaderCell")
        
        homeCollectionView.reloadData()
        print("dfrffr")
    }
    override func viewWillAppear(_ animated: Bool) {
        homeCollectionView.reloadData()
        print("dismiss ediyor musun?")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == showComplaintDetailSegueIdentifier {
            let vc = segue.destination as! ComplaintDetailViewController
            vc.complaint = sender as? ComplaintModel
        }
        else if segue.identifier == showSurveyDetailSegueIdentifier {
            let vc = segue.destination as! SurveyDetailViewController
           // vc.complaint = sender as? ComplaintModel
    }
    }
    
    
    
    // MARK: CollectionViewCell Functions
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return AppManager.shared.array[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell = homeCollectionView.dequeueReusableCell(withReuseIdentifier: "HomeListCollectionViewCell", for: indexPath) as! HomeListCollectionViewCell
            cell.viewModel = (AppManager.shared.array[indexPath.section][indexPath.row] as! TitleCellViewModel)
            cell.onButtonTapped = { [unowned self] in
                self.performSegue(withIdentifier: self.showSurveyDetailSegueIdentifier, sender: nil)
            }
            // cell.viewModel = (array[indexPath.section][indexPath.row] as! TitleCellViewModel)
            return cell
        }
        else {
            let cell = homeCollectionView.dequeueReusableCell(withReuseIdentifier: "HomeListCollectionViewComplaintCell", for: indexPath) as! HomeListCollectionViewComplaintCell
            cell.viewModel = (AppManager.shared.array[indexPath.section][indexPath.row] as! ComplaintModel)
            //  cell.viewModel = (array[indexPath.section] [indexPath.row] as! ComplaintModel)
            cell.onButtonTapped = {[unowned self] (viewModel) in
                
                self.performSegue(withIdentifier: self.showComplaintDetailSegueIdentifier, sender: viewModel)
            }
            print(indexPath.section, indexPath.row)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize (width: homeCollectionView.frame.width - 80.0, height: 100)
    }
    
    // MARK: HeaderViewCell Functions
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch kind {
            
        case UICollectionView.elementKindSectionHeader:
            let headerView = homeCollectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HomeCollectionViewHeaderCell", for: indexPath) as! HomeCollectionViewHeaderCell
            
            headerView.header = headerArray[indexPath.section]
            
            headerView.backgroundColor = UIColor.gray
            return headerView
            
        default:
            assert(false, "Unexpected element kind")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: homeCollectionView.frame.width - 40, height: 70.0)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return AppManager.shared.array.count
        //return array.count
    }
    
    // MARK: Functions of spacing of the CollecitonViewCells' 
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    }
    
    func addComplaintToList() {
        
        homeCollectionView.reloadData()
    }
}
