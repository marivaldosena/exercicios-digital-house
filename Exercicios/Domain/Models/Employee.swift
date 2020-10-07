//
//  Person.swift
//  Exercicios
//
//  Created by Marivaldo Sena on 04/10/20.
//

import Foundation

struct Employee {
    var name: String
    var email: String
    var position: EmployeePosition
    
    init(name: String, email: String, position: EmployeePosition) {
        self.name = name
        self.email = email
        self.position = position
    }
}

extension Employee: Hashable {
    static func == (lhs: Employee, rhs: Employee) -> Bool {
        return lhs.name == rhs.name
    }
}
