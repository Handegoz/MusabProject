//
//  AddComplaintViewController.swift
//  Beginning
//
//  Created by Hande on 9/26/19.
//  Copyright © 2019 Hande. All rights reserved.
//

import UIKit

class AddComplaintViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var addComplaintTitleTextField: UITextField!
    @IBOutlet weak var addComplaintCatagoryTextField: UITextField!
    @IBOutlet weak var addComplaintDetailTextField: UITextField!
    
    
    let pickerData = [String] (arrayLiteral: "Ulaşım", "Yemek", "Ofis Arızaları", "Bilgi İşlem")
      var delegate:AddComplaintDelegate?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let addComplaintCatagoryPicker = UIPickerView()
        addComplaintCatagoryTextField.inputView = addComplaintCatagoryPicker
        addComplaintCatagoryPicker.delegate = self

    }
    

    
    // MARK: PickerView Functions
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        addComplaintCatagoryTextField.text = pickerData[row]
    }
//    func addComplaintToList(_ model:ComplaintModel) {
//        print("asd")
//        //  self.array[1].insert(model, at: 0)
//        AppManager.shared.array[1].insert(model, at: 0)
//       // homeCollectionView.reloadData()
//
//    }
    
    @IBAction func onTappedBackButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onTappedAddButton(_ sender: UIButton) {
        let model = ComplaintModel(id: 0, catagory:  addComplaintCatagoryTextField!.text!, title: addComplaintTitleTextField!.text!, detail: addComplaintDetailTextField!.text!, answer: nil, state: 0, creationDate: Date())
        
       AppManager.shared.array[1].insert(model, at: 0)
        delegate?.addComplaintToList()
    
        dismiss(animated: true, completion: nil)

    }
    
    
}
