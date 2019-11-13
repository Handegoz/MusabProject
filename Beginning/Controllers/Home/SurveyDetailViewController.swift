//
//  SurveyDetailViewController.swift
//  Beginning
//
//  Created by Hande on 10/28/19.
//  Copyright © 2019 Hande. All rights reserved.
//

import UIKit

class SurveyDetailViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var surveyDetailCollectionView: UICollectionView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    
    var currentPage:Int = 0 {
        didSet {
            changeButtonsStates()
        }
    }
    
    var data: [Any] = [IntroductionViewModel(title: "deneme", detail: "123"), OpenEndViewModel(question: "Naber Mert?", answer: nil), ScaleCellViewModel(question: "bişeyler salla şimdilik, hande nağber?", answer: 3)]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        surveyDetailCollectionView.delegate = self
        surveyDetailCollectionView.dataSource = self
        
        surveyDetailCollectionView.register(UINib.init(nibName: "SurveyCollectionViewIntroductionCell", bundle: nil), forCellWithReuseIdentifier: "SurveyCollectionViewIntroductionCell")
        surveyDetailCollectionView.register(UINib.init(nibName: "SurveyCollectionViewOpenEndCell", bundle: nil), forCellWithReuseIdentifier: "SurveyCollectionViewOpenEndCell")
         surveyDetailCollectionView.register(UINib.init(nibName: "SurveyCollectionViewScaleCell", bundle: nil), forCellWithReuseIdentifier: "SurveyCollectionViewScaleCell")
        
        changeButtonsStates()
        surveyDetailCollectionView.reloadData()
    }
    
    // MARK: CollectionView Functions
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let model = data[indexPath.row]
        
        if let model = model as? IntroductionViewModel {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SurveyCollectionViewIntroductionCell", for: indexPath) as! SurveyCollectionViewIntroductionCell
            cell.viewModel = model
            return cell
        }
        else if let model = model as? OpenEndViewModel  {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SurveyCollectionViewOpenEndCell", for: indexPath) as! SurveyCollectionViewOpenEndCell
            cell.onValueChanged = {[unowned self] (viewModel) in
                self.test1(viewModel)
            }
            cell.viewModel = model
            return cell
        }
        else {
            let model = model as! ScaleCellViewModel
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SurveyCollectionViewScaleCell", for: indexPath) as! SurveyCollectionViewScaleCell
            cell.onValueChanged = {[unowned self] (viewModel) in
            }
            cell.viewModel = model
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize (width: collectionView.frame.width, height: collectionView.frame.height)
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let page = scrollView.contentOffset.x / scrollView.frame.width
        currentPage = Int(page)
        print("Mert\(Int(page))")
    }
    private func changeButtonsStates () {
        if currentPage == 0 {
            backButton.isEnabled = false
            nextButton.isEnabled = true
        }
        else {
            backButton.isEnabled = true
            nextButton.isEnabled = false
        }
        let model = data [currentPage]
        if let model = model as? OpenEndViewModel, let asnwer = model.answer {
            nextButton.isEnabled = true
        }
        if let model = model as? ScaleCellViewModel, let asnwer = model.answer {
            nextButton.isEnabled = true
        }
        if currentPage == data.count - 1 {
            nextButton.setTitle("Bitir", for: .normal)
        }
        else {
            nextButton.setTitle("İleri", for: .normal)
        }
    }
    
    @IBAction func onTappedBackButton(_ sender: UIButton) {
        if currentPage < data.count  && currentPage > 0 {
            currentPage -= 1
            let indexPath = IndexPath(row: currentPage, section: 0)
            surveyDetailCollectionView.scrollToItem(at: indexPath , at: .right, animated: true)
        }
//        if currentPage < data.count -1 && currentPage > 0 {
//
//        currentPage -= 1
//        }
//
        print("geri")
    }
    
    @IBAction func onTappedNextButton(_ sender: UIButton) {
        if currentPage < data.count - 1 {
            currentPage += 1
            let indexPath = IndexPath(row: currentPage, section: 0)
            surveyDetailCollectionView.scrollToItem(at: indexPath , at: .left, animated: true)
            print("ileri")
        }
        else {
        }
    }
    private func test1 (_ model:OpenEndViewModel) {
        if let answer = model.answer, answer != "" {
            nextButton.isEnabled = true
        }
        else {
            nextButton.isEnabled = false
        }
    }
}
