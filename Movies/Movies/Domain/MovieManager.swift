//
//  MovieManager.swift
//  Movies
//
//  Created by Marivaldo Sena on 18/10/20.
//

import Foundation

class MovieManager: RepositoryProtocol {
    typealias Item = Movie
    typealias Manager = MovieManager
    private static var managerInstance: MovieManager?
    private var items: [Item] = []
    
    subscript(_ index: Int) -> Item? {
        return self.get(index)
    }
    
    func get(_ index: Int) -> Item? {
        guard self.isIndexValid(index: index) else {
            return nil
        }
        
        return items[index]
    }
    
    func getAll() -> [Movie] {
        return self.items
    }
    
    func add(_ item: Item?) {
        guard let item = item else { return }
        
        self.items.append(item)
    }
    
    func addAll(_ items: [Movie]?) {
        guard let items = items else { return }
        
        self.items.append(contentsOf: items)
    }
    
    func remove(_ index: Int) {
        if self.isIndexValid(index: index) {
            self.items.remove(at: index)
        }
    }
    
    func remove(_ item: Movie?) {
        if let item = item {
            self.items = self.items.filter { $0 != item }
        }
    }
    
    func search(term: String) -> [Item] {
        if !term.isEmpty {
            let filteredItems = self.items.filter { $0.title.lowercased().contains(term.lowercased())}
            
            return filteredItems
        }
        
        return self.items
    }
    
    func getNumberOfItems() -> Int {
        return self.items.count
    }
    
    static func getManagerInstance() -> Manager {
        if let managerInstance = getManagerInstance() {
            return managerInstance
        }
        
        return MovieManager()
    }
    
    private static func getManagerInstance() -> Manager? {
        if let managerInstance = managerInstance {
            return managerInstance
        }
        
        managerInstance = MovieManager()
        
        return managerInstance ?? MovieManager()
    }
    
    private func isIndexValid(index: Int) -> Bool {
        if items.count > 0 && (index >= 0 && index < items.count) {
            return true
        }
        
        return false
    }
}

