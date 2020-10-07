//
//  EmployeeRepository.swift
//  Exercicios
//
//  Created by Marivaldo Sena on 04/10/20.
//

import Foundation

class EmployeeRepository {
    private var employees: [Employee]
    
    init(employees: [Employee]) {
        self.employees = employees
    }
    
    convenience init() {
        self.init(employees: [])
    }
    
    func addEmployee(employee: Employee) {
        self.employees.append(employee)
    }
    
    func addEmployee(name: String, email: String, position: EmployeePosition) {
        let employee = Employee(name: name, email: email, position: position)
        
        self.addEmployee(employee: employee)
    }
    
    func addEmployee(employee: [Employee]) {
        self.employees.append(contentsOf: employee)
    }
    
    func getAllEmployees() -> [Employee] {
        return self.employees
    }
    
    func getAllEmployees() -> String {
        let employees: [Employee] = self.getAllEmployees()
        var result = ""
        
        for item in employees {
            result += "Name: \(item.name), Position: \(item.position), E-mail: \(item.email)"
        }
        
        return result
    }
    
    private func isIndexValid(index: Int) -> Bool {
        if index >= 0 && index < self.employees.count {
            return true
        }
        
        return false
    }
    
    func searchBy(term: String) -> [Employee] {
         let foundEmployees = self.employees.filter{ $0.searchBy(term: term) }
        
        return foundEmployees
    }
    
    func searchBy(email: String) -> [Employee] {
        let foundEmployees = self.employees.filter{ $0.searchBy(email: email) }
        
        return foundEmployees
    }
    
    func searchBy(name: String) -> [Employee] {
        let foundEmployees = self.employees.filter{ $0.searchBy(name: name) }
        
        return foundEmployees
    }
    
    func searchBy(position: String) -> [Employee] {
        let foundEmployees = self.employees.filter{ $0.searchBy(position: position) }
        
        return foundEmployees
    }
    
    func getEmployee(at index: Int) -> Employee? {
        if self.isIndexValid(index: index) {
            return self.employees[index]
        }
        
        return nil
    }
    
    func removeEmployee(email: String) {
        self.employees = self.employees.filter{ $0.email.lowercased() != email.lowercased() }
    }
    
    func getNumberOfEmployees() -> Int {
        return self.employees.count
    }
}
