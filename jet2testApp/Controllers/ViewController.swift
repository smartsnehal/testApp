//
//  ViewController.swift
//  jet2testApp
//
//  Created by Snehal Trimukhe on 22/02/20.
//  Copyright © 2020 Snehal Trimukhe. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate{

    @IBOutlet weak var txtNumber: UITextField!
    @IBOutlet weak var sortSegmentControl: UISegmentedControl!
    var segArray = ["name","age"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func seeRecords(_ sender: Any) {
        if let vc = storyboard?.instantiateViewController(identifier: "EmployeeListTableViewController") as? EmployeeListTableViewController {
            if txtNumber.text?.count != 0 {
                vc.number = Int(txtNumber.text!)!
                vc.sortBy =  segArray[ sortSegmentControl.selectedSegmentIndex]
                
            }
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
         guard CharacterSet(charactersIn: "123456789").isSuperset(of: CharacterSet(charactersIn: string)) else {
             return false
         }
         return true
    }
}


