//
//  AnimalRepository.swift
//  Exercicios
//
//  Created by Marivaldo Sena on 05/10/20.
//

import Foundation

class AnimalRepository {
    private var animals: [Animal]
    private var activeAnimal: Animal?
    
    init(animals: [Animal]) {
        self.animals = animals
    }
    
    convenience init() {
        self.init(animals: [])
    }
    
    func addAnimals(animals: [Animal]) {
        self.animals.append(contentsOf: animals)
    }
    
    func getAllAnimals() -> [Animal] {
        return self.animals
    }
    
    func getNumberOfAnimals() -> Int {
        return self.animals.count
    }
    
    func getAnimal(at index: Int) -> Animal? {
        if self.isIndexValid(index: index) {
            return self.animals[index]
        }
        
        return nil
    }
    
    private func isIndexValid(index: Int) -> Bool {
        if index >= 0 && index < self.animals.count {
            return true
        }
        
        return false
    }
    
    func getRandomAnimal() -> Animal? {
        let randomAnimal = self.animals.randomElement()
        
        return randomAnimal
    }
    
    func setActiveAnimal(activeAnimal: Animal?) {
        self.activeAnimal = activeAnimal
    }
    
    func getActiveAnimal() -> Animal? {
        return self.activeAnimal
    }
}
