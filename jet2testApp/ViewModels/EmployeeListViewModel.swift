//
//  EmployeeListViewModel.swift
//  jet2testApp
//
//  Created by Snehal Trimukhe on 22/02/20.
//  Copyright © 2020 Snehal Trimukhe. All rights reserved.
//

import Foundation

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
    
    var imageName: String {
        return self.employee.picture?.thumbnail ?? ""
    }
}
