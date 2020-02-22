//
//  EmployeeListTableViewController.swift
//  jet2testApp
//
//  Created by Snehal Trimukhe on 22/02/20.
//  Copyright © 2020 Snehal Trimukhe. All rights reserved.
//

import UIKit
import Foundation

class EmployeeListTableViewController: UITableViewController {
    
    private var employeeListVM: EmployeeListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup() {
    self.navigationController?.navigationBar.prefersLargeTitles = true
        
        let url = URL(string: "https://randomuser.me/api/?results=1000")!
        
        WebService().getEmployeeList(url:url){ employees in
            if let employees = employees {
                
                self.employeeListVM = EmployeeListViewModel(employees: employees)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
         return self.employeeListVM == nil ? 0 : self.employeeListVM.numberOfSections
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.employeeListVM.numberOfRowsInSection(section: section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "EmployeeTableViewCell", for: indexPath) as? EmployeeTableViewCell
            else {
                fatalError("Employee Cell error")
        }
        
        let employeeVM = self.employeeListVM.employeeAtIndex(index: indexPath.row)
        cell.configureCell(vm: employeeVM)
        
        return cell
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
