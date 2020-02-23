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
    var number = 5
    var sortBy = "name"
    static var isOffline = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    func setup() {
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        // fetch records from WebAPI
        let url = URL(string: "https://randomuser.me/api/?results=\(number)")!
        
        WebService().getEmployeeList(url:url){ employees in
            if let employees = employees {
            
                self.employeeListVM = EmployeeListViewModel(employees: employees)
                self.employeeListVM.sortEmployees(sortBy: self.sortBy)
                let empList = EmployeeList.init(Employees: employees)
                if employees.count != 0
                {
                DataManager.shared.saveEmployees(empList: empList)
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
            else
            {
                print("error")
                EmployeeListTableViewController.isOffline = true
                
               if EmployeeListTableViewController.isOffline {
                DispatchQueue.main.async {
                    if let empList = DataManager.shared.loadEmployees()
                    {
                        
                        self.employeeListVM = EmployeeListViewModel(employees: empList.Employees!)
                        self.tableView.reloadData()
                    }
                    
                }
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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc  = storyboard?.instantiateViewController(identifier: "EmployeeDetailsViewController") as? EmployeeDetailsViewController {
            // employee details
            vc.employeeVM = self.employeeListVM.employeeAtIndex(index: indexPath.row)
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
