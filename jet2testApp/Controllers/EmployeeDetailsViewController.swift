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
        self.navigationController?.navigationBar.prefersLargeTitles = true
        guard let vm = employeeVM else{
            fatalError("EmployeeViewModel not available" )
        }
        self.title = vm.fullName
        
        let url = URL(string: vm.imageLargeName)!
        // imgViewPic.load(url: URL(string: vm.imageLargeName)!)
        if let cachedImage = DataManager.shared.imageCache.object(forKey: url.absoluteString as NSString) {
            self.imgViewPic.image = cachedImage as! UIImage
        } else {
        self.imgViewPic.load(url: url)
            let image = UIImage(data: (self.imgViewPic.image?.pngData())!)
            DataManager.shared.imageCache.setObject(image!, forKey: url.absoluteString as NSString)
        }
        
        lblEmail.text = "Email: \(vm.email)"
        lblPhone.text = "Phone: \(vm.phoneNumber)"
        lblDob.text = "DOB: \(vm.dob)"
        lblLoc.text = vm.fullLocation
        if let loc = vm.mapLocation as? CLLocationCoordinate2D
        {
            self.setupMap(coord:loc)
        }        
    }
    
    func setupMap(coord:CLLocationCoordinate2D)
    {
        let regionRadius: CLLocationDistance = 1000
       
        let region = MKCoordinateRegion(center: coord,
                                        latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        self.mapViewLocation.setRegion(region, animated: true)
        let annotation = MKPointAnnotation()
        annotation.coordinate = coord
        self.mapViewLocation.addAnnotation(annotation)
    }
}
