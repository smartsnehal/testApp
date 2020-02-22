//
//  EmployeeTableViewCell.swift
//  jet2testApp
//
//  Created by Snehal Trimukhe on 22/02/20.
//  Copyright © 2020 Snehal Trimukhe. All rights reserved.
//

import UIKit

class EmployeeTableViewCell: UITableViewCell {
    @IBOutlet weak var lblFirstName: UILabel!
    
    @IBOutlet weak var LblLastName: UILabel!
    
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
}
