//
//  EmployeeDetailViewController.swift
//  Exercicios
//
//  Created by Marivaldo Sena on 05/10/20.
//

import UIKit

class EmployeeDetailViewController: UIViewController {
    @IBOutlet weak var employeeImageView: UIImageView!
    @IBOutlet weak var employeeNameLabel: UILabel!
    @IBOutlet weak var employeePositionLabel: UILabel!
    @IBOutlet weak var employeeEmailLabel: UILabel!
    
    private var employee: Employee?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let employee = employee {
            self.loadEmployeeData(employee: employee)
        }
    }
    
    func setEmployee(employee: Employee) {
        self.employee = employee
    }
    
    private func loadEmployeeData(employee: Employee) {
        employeeImageView.image = UIImage(named: "Employee")
        employeeEmailLabel.text = employee.email
        employeeNameLabel.text = employee.name
        employeePositionLabel.text = employee.position.rawValue
    }
    
    @IBAction func goToAllEmployees(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
