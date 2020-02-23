//
//  DataManager.swift
//  jet2testApp
//
//  Created by Snehal Trimukhe on 23/02/20.
//  Copyright © 2020 Snehal Trimukhe. All rights reserved.
//

import UIKit

class DataManager: NSObject{
    static let shared = DataManager()
    
    let imageCache = NSCache<AnyObject, AnyObject>()
    let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("Preferences.plist")
    
    func saveEmployees(empList: EmployeeList) {
        let encoder = PropertyListEncoder()
        encoder.outputFormat = .xml
        // save data to plist
        
        do {
          let data = try encoder.encode(empList)
          try data.write(to: path)
            print(path)
        } catch {
          // Handle error
          print(error)
        }
    }
    
    func loadEmployees() -> EmployeeList?
    {
        // load data from plist
        do {
            let data = try Data(contentsOf: path)
            let decoder = PropertyListDecoder()
             let empList = try decoder.decode(EmployeeList.self, from: data)
            return empList
        } catch {
            // Handle error
            print(error)
        }
        return nil
    }
}
