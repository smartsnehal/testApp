//
//  Employee.swift
//  jet2testApp
//
//  Created by Snehal Trimukhe on 22/02/20.
//  Copyright © 2020 Snehal Trimukhe. All rights reserved.
//

import Foundation

struct EmployeeList: Codable {
    let Employees: [Employee]?
    
    private enum CodingKeys: String, CodingKey {
        case Employees = "results"
    }
}

struct Employee: Codable {
    let gender: String?
    let name : Name?
    let picture: Picture?
}

struct Name: Codable {
    let first: String?
    let last: String?
}

struct Picture: Codable {
    let medium: String?
}
