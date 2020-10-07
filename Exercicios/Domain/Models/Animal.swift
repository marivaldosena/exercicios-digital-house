//
//  Animal.swift
//  Exercicios
//
//  Created by Marivaldo Sena on 05/10/20.
//

import Foundation

struct Animal {
    var name: String
    var breed: String
    var species: String
    var weight: Double
    var imageName: String
    
    init() {
        self.init(name: "Unnamed", breed: "Unknown", species: "Unkown", weight: 0.0, imageName: "NotAvailable")
    }
    
    init(name: String, breed: String, species: String, weight: Double, imageName: String) {
        self.name = name
        self.breed = breed
        self.species = species
        self.weight = weight
        self.imageName = imageName
    }
}
