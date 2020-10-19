//
//  RepositoryProtocol.swift
//  Movies
//
//  Created by Marivaldo Sena on 18/10/20.
//

import Foundation

protocol RepositoryProtocol {
    associatedtype Item
    associatedtype Manager
    
    func get(_ index: Int) -> Item?
    func getAll() -> [Item]
    func add(_ item: Item?)
    func addAll(_ items: [Item]?)
    func remove(_ index: Int)
    func remove(_ item: Item?)
    func search(term: String) -> [Item]
    func getNumberOfItems() -> Int
    static func getManagerInstance() -> Manager
}
