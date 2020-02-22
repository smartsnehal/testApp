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
    let dob: DOB
    let email: String?
    //let location: Location?
    let phone: String?
}

struct Name: Codable {
    let title: String?
    let first: String?
    let last: String?
}

struct Picture: Codable {
    let thumbnail: String?
    let large: String?
}

struct DOB: Codable {
    let date: String
}

struct Location: Codable {
    let city: String?
    let state:String?
    let country: String?
    let postcode: String?
    let street: Street?
    let coordinates: Coordinates?
}
struct Coordinates: Codable {
    let latitude: String?
    let longitude: String?
}
struct Street: Codable {
    let number: Int
    let name: String?
}

