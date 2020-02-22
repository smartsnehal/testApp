//
//  EmployeeDetailsViewController.swift
//  jet2testApp
//
//  Created by Snehal Trimukhe on 22/02/20.
//  Copyright © 2020 Snehal Trimukhe. All rights reserved.
//

import UIKit
import MapKit
class EmployeeDetailsViewController: UIViewController {
    
    @IBOutlet weak var imgViewPic: UIImageView!
    
    @IBOutlet weak var mapViewLocation: MKMapView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblPhone: UILabel!
    @IBOutlet weak var lblDob: UILabel!
    
    @IBOutlet weak var lblLoc: UILabel!
    
    var employeeVM: EmployeeViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    func setup()
    {
        guard let vm = employeeVM else{
            fatalError("EmployeeViewModel not available" )
        }
        imgViewPic.load(url: URL(string: vm.imageLargeName)!)
        lblName.text = "Name: \(vm.fullName)"
        lblEmail.text = "Email: \(vm.email)"
        lblPhone.text = "Phone: \(vm.phoneNumber)"
        lblDob.text = "DOB: \(vm.dob)"
        
    }
}
