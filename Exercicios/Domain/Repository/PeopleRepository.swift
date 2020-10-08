//
//  PeopleRepository.swift
//  Exercicios
//
//  Created by Marivaldo Sena on 08/10/20.
//

import Foundation

class PeopleRepository: RepositoryProtocol {
    typealias T = Person
    private var items: [Person]
    
    init(collection: [Person]) {
        self.items = collection
    }
    
    convenience init() {
        self.init(collection: [])
    }
    
    func add(item: Person) {
        self.items.append(item)
    }
    
    func addAll(collection: [Person]) {
        self.items.append(contentsOf: collection)
    }
    
    func getNumberOfItems() -> Int {
        return self.items.count
    }
    
    func getItem(at index: Int) -> Person? {
        if self.isIndexValid(index: index) {
            return self.items[index]
        }
        
        return nil
    }
    
    func getAll() -> [Person] {
        return self.items
    }
    
    private func isIndexValid(index: Int) -> Bool {
        if index >= 0 && index < self.items.count {
            return true
        }
        
        return false
    }
    
}
