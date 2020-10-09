//
//  AppRepository.swift
//  Exercicios
//
//  Created by Marivaldo Sena on 09/10/20.
//

import Foundation

class AppRepository: RepositoryProtocol {
    typealias T = App
    private var items: [App]
    
    init(collection: [App]) {
        self.items = collection
    }
    
    convenience init() {
        self.init(collection: [])
    }
    
    func add(item: App) {
        self.items.append(item)
    }
    
    func addAll(collection: [App]) {
        self.items.append(contentsOf: collection)
    }
    
    func getNumberOfItems() -> Int {
        return self.items.count
    }
    
    func getItem(at index: Int) -> App? {
        if self.isIndexValid(index: index) {
            return self.items[index]
        }
        
        return nil
    }
    
    func getAll() -> [App] {
        return self.items
    }
    
    private func isIndexValid(index: Int) -> Bool {
        if index >= 0 && index < self.items.count {
            return true
        }
        
        return false
    }
    
}
