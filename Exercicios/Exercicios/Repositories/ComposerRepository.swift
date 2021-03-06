//
//  PeopleRepository.swift
//  Exercicios
//
//  Created by Marivaldo Sena on 08/10/20.
//

import Foundation

class ComposerRepository: RepositoryProtocol {
    typealias T = Composer
    private var items: [Composer]
    private var activeItem: Composer?
    
    init(collection: [Composer]) {
        self.items = collection
    }
    
    convenience init() {
        self.init(collection: [])
    }
    
    func add(item: Composer) {
        self.items.append(item)
    }
    
    func addAll(collection: [Composer]) {
        self.items.append(contentsOf: collection)
    }
    
    func getNumberOfItems() -> Int {
        return self.items.count
    }
    
    func getItem(at index: Int) -> Composer? {
        if self.isIndexValid(index: index) {
            return self.items[index]
        }
        
        return nil
    }
    
    func getAll() -> [Composer] {
        return self.items
    }
    
    private func isIndexValid(index: Int) -> Bool {
        if index >= 0 && index < self.items.count {
            return true
        }
        
        return false
    }
    
    func setActiveItem(item: Composer?) {
        self.activeItem = item
    }
    
    func getActiveItem() -> Composer? {
        return self.activeItem
    }
    
    func delete(item: Composer) {
        self.items = self.items.filter{ $0 != item }
    }
    
    func delete(item: Composer?) {
        if let item = item {
            self.delete(item: item)
        }
    }
    
    func delete(item: Composer, callback: () -> Void) {
        self.delete(item: item)
        callback()
    }
    
    func delete(item: Composer?, callback: () -> Void) {
        self.delete(item: item)
        callback()
    }
}
