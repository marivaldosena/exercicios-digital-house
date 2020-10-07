//
//  EmployeeListViewController.swift
//  Exercicios
//
//  Created by Marivaldo Sena on 04/10/20.
//

import UIKit

class EmployeeListViewController: UIViewController {
    @IBOutlet weak var employeeTableViewList: UITableView!
    @IBOutlet weak var employeeSearchBar: UISearchBar!
    
    private var employees = [Employee]()
    private var employeeRepository = EmployeeRepository()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        employeeTableViewList.delegate = self
        employeeTableViewList.dataSource = self
        employeeSearchBar.delegate = self
        
        employeeRepository.addEmployee(employee: EmployeeSeed.seed())
        employees = employeeRepository.getAllEmployees()
    }
    
    @IBAction func goToRoot(_ sender: UIButton) {
        goToRoot()
    }
    
    func getEmployees() -> [Employee] {
        return self.employees
    }
    
    func setEmployees(employees: [Employee]) {
        self.employees = employees
    }
    
    func getEmployeeRepository() -> EmployeeRepository {
        return self.employeeRepository
    }
    
    func setEmployeeRepository(employeeRepository: EmployeeRepository) {
        self.employeeRepository = employeeRepository
    }
}

