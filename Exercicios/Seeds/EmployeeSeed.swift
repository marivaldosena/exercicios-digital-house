//
//  EmployeeSeed.swift
//  Exercicios
//
//  Created by Marivaldo Sena on 04/10/20.
//

import Foundation

struct EmployeeSeed {
    
    static func seed() -> [Employee] {
        let employees = [
            Employee(name: "Ada LoveLace", email: "ada.lovelace@pascal.com", position: EmployeePosition.Manager),
            Employee(name: "Dulciana Konertz", email: "dkonertz0@shinystat.com", position: EmployeePosition.Designer),
            Employee(name: "Joan Sabin", email: "jsabin1@ning.com", position: EmployeePosition.Developer),
            Employee(name: "Becka Hutt", email: "bhutt3@wikimedia.org", position: EmployeePosition.Manager),
            Employee(name: "Carolus Hinks", email: "chinks4@thetimes.co.uk", position: EmployeePosition.ProductOwner),
            Employee(name: "Lucius Sanbrooke", email: "lsanbrooke5@lycos.com", position: EmployeePosition.Designer),
            Employee(name: "Titus Dulson", email: "tdulson6@hhs.gov", position: EmployeePosition.Developer),
            Employee(name: "Lyle Lewing", email: "llewing7@cbsnews.com", position: EmployeePosition.Designer),
            Employee(name: "Lorita Gludor", email: "lgludor8@sohu.com", position: EmployeePosition.Designer),
            Employee(name: "Issie Huard", email: "ihuard9@addtoany.com", position: EmployeePosition.Developer),
            Employee(name: "Franni Goalby", email: "fgoalbya@samsung.com", position: EmployeePosition.Developer),
            Employee(name: "Vaughan Lomath", email: "vlomathb@godaddy.com", position: EmployeePosition.Manager),
            Employee(name: "Corney Heel", email: "cheelc@omniture.com", position: EmployeePosition.ProductOwner),
            Employee(name: "Jakob Gravey", email: "jgraveyd@tripod.com", position: EmployeePosition.Designer),
            Employee(name: "Melessa Naylor", email: "mnaylore@nba.com", position: EmployeePosition.ProductOwner)
        ]
        
        return employees
    }
    
}
