//
//  EmployeeTableViewCell.swift
//  jet2testApp
//
//  Created by Snehal Trimukhe on 22/02/20.
//  Copyright © 2020 Snehal Trimukhe. All rights reserved.
//

import UIKit

class EmployeeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblFullName: UILabel!
    @IBOutlet weak var LblGender: UILabel!
    
    @IBOutlet weak var imgViewEmployee: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configureCell(vm:EmployeeViewModel)
    {
        self.lblFullName.text = "\(vm.firstName) \(vm.lastName)"
        self.LblGender.text = vm.gender
        self.imgViewEmployee.load(url: URL(string: vm.imageName)!)
    }
}
