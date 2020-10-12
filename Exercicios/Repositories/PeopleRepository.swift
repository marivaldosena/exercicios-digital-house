//
//  PeopleRepository.swift
//  Exercicios
//
//  Created by Marivaldo Sena on 10/10/20.
//

import Foundation

class PeopleRepository: RepositoryProtocol {
    typealias T = Person
    private var items: [Person]
    
    convenience init() {
        self.init(collection: [])
    }
    
    init(collection: [Person]) {
        self.items = collection
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
    
    func searchBy(term: String) -> [Person] {
        let result = self.items.filter { $0.searchBy(term: term) }
        
        return result
    }
    
    private func isIndexValid(index: Int) -> Bool {
        if index >= 0 && index < self.items.count {
            return true
        }
        
        return false
    }
}
