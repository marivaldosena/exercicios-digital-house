//
//  EmployeeExtensions.swift
//  Exercicios
//
//  Created by Marivaldo Sena on 05/10/20.
//

import Foundation

extension Employee {
    func searchBy(term: String) -> Bool {
        let result = self.searchBy(email: term) || self.searchBy(name: term) || self.searchBy(position: term)
        
        return result
    }
    
    func searchBy(email: String) -> Bool {
        let result = self.email.lowercased().contains(email.lowercased())
        
        return result
    }
    
    func searchBy(name: String) -> Bool {
        let result = self.name.lowercased().contains(name.lowercased())
        
        return result
    }
    
    func searchBy(position: String) -> Bool {
        let result = self.position.rawValue.lowercased().contains(position.lowercased())
        
        return result
    }
}
