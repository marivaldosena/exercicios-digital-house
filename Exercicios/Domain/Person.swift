//
//  Person.swift
//  Exercicios
//
//  Created by Marivaldo Sena on 10/10/20.
//

import Foundation

//MARK: - Person
class Person {
    var name: String
    var imageName: String
    var profileUrl: String
    
    init(name: String, imageName: String, profileUrl: String) {
        self.name = name
        self.imageName = imageName
        self.profileUrl = profileUrl
    }
}

//MARK: - Person
extension Person {
    func searchBy(term: String) -> Bool {
        let isFound = self.searchBy(name: term) || self.searchBy(imageName: term) || self.searchBy(profileUrl: term)
        
        return isFound
    }
    
    func searchBy(name: String) -> Bool {
        return self.isTermInContainedInField(name, self.name)
    }
    
    func searchBy(imageName: String) -> Bool {
        return self.isTermInContainedInField(imageName, self.imageName)
    }
    
    func searchBy(profileUrl: String) -> Bool {
        return self.isTermInContainedInField(profileUrl, self.profileUrl)
    }
    
    private func isTermInContainedInField(_ term: String, _ field: String) -> Bool {
        let isFound = field.lowercased().contains(term.lowercased())
        
        return isFound
    }
}

//MARK: - Person: Equatable
extension Person: Equatable {
    static func == (lhs: Person, rhs: Person) -> Bool {
        let isEqual = lhs.name == rhs.name && lhs.imageName == rhs.imageName && lhs.profileUrl == rhs.profileUrl
        
        return isEqual
    }
}

//MARK: - Person: Hashable
extension Person: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.name)
        hasher.combine(self.imageName)
        hasher.combine(self.profileUrl)
    }
}

//MARK: - Person: Comparable
extension Person: Comparable {
    static func < (lhs: Person, rhs: Person) -> Bool {
        return isLessThan(lhs, rhs)
    }
    
    static func > (lhs: Person, rhs: Person) -> Bool {
        return !isLessThan(lhs, rhs)
    }
    
    private static func isLessThan(_ lhs: Person, _ rhs: Person) -> Bool {
        return lhs.name < rhs.name
    }
}
