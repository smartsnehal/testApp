//
//  EmployeeListViewModel.swift
//  jet2testApp
//
//  Created by Snehal Trimukhe on 22/02/20.
//  Copyright © 2020 Snehal Trimukhe. All rights reserved.
//

import Foundation
import MapKit

struct EmployeeListViewModel {
    let employees: [Employee]
}

extension EmployeeListViewModel {
    
    var numberOfSections: Int {
        return 1
    }
    
    func numberOfRowsInSection(section: Int) -> Int {
        return self.employees.count
    }
    
    func employeeAtIndex(index: Int) -> EmployeeViewModel {
        let employee = self.employees[index]
        return EmployeeViewModel(employee)
    }
    
}

struct EmployeeViewModel {
    private let employee: Employee
}

extension EmployeeViewModel {
    init(_ employee: Employee) {
        self.employee = employee
    }
}

extension EmployeeViewModel {
    var gender: String {
        return self.employee.gender ?? ""
    }
    
    var firstName: String {
        return self.employee.name?.first ?? ""
    }
    
    var lastName: String {
        return self.employee.name?.last ?? ""
    }
    
    var fullName: String {
        var title = self.employee.name?.title ?? ""
        return "\(title) \(firstName) \(lastName)"
    }
    
    var imageName: String {
        return self.employee.picture?.thumbnail ?? ""
    }
    
    var imageLargeName: String {
        return self.employee.picture?.large ?? ""
    }
    
    var email: String {
        return self.employee.email ?? ""
    }
    
    var phoneNumber: String {
        return self.employee.phone ?? ""
    }
    
    var dob: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
      if let date = dateFormatter.date(from:self.employee.dob.date) {
        dateFormatter.dateFormat = "dd-MMM-yyyy"
        dateFormatter.timeZone = NSTimeZone.local
        let timeStamp = dateFormatter.string(from: date)
        return timeStamp
        } else {
        return ""
        }
    }
    
  /*  var fullLocation: String {
        var number = self.employee.location?.street?.number
        
        return "\(number)"
    }
    */
    
 /*  var mapLocation: CLLocation {
        return self.employee.picture?.thumbnail ?? ""
    }
 */
}
