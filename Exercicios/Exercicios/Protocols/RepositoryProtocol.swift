//
//  RepositoryProtocol.swift
//  Exercicios
//
//  Created by Marivaldo Sena on 08/10/20.
//

import Foundation

protocol RepositoryProtocol {
    associatedtype T
    
    func add(item: T)
    func addAll(collection: [T])
    func getNumberOfItems() -> Int
    func getItem(at: Int) -> T?
    func getAll() -> [T]
}
