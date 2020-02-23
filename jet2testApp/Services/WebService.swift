//
//  WebService.swift
//  jet2testApp
//
//  Created by Snehal Trimukhe on 22/02/20.
//  Copyright © 2020 Snehal Trimukhe. All rights reserved.
//

import UIKit
import Foundation

class WebService {
    
    func getEmployeeList(url: URL, completion: @escaping ([Employee]?) -> ()) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
                
                let empList = try? JSONDecoder().decode(EmployeeList.self, from: data)
                
                if let empList = empList {
                    completion(empList.Employees)
                }
                
               // print(empList?.Employees)
                
            }
            
        }.resume()
        
    }

}
