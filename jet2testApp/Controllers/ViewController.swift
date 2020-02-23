//
//  ViewController.swift
//  jet2testApp
//
//  Created by Snehal Trimukhe on 22/02/20.
//  Copyright © 2020 Snehal Trimukhe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var txtRecord: UITextField!
    @IBOutlet weak var sortSegmentControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func performSegue(withIdentifier identifier: String, sender: Any?) {
        if identifier == "listSegue"
        {
            
        }
    }
}

