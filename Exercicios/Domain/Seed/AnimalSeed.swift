//
//  AnimalSeed.swift
//  Exercicios
//
//  Created by Marivaldo Sena on 05/10/20.
//

import Foundation

struct AnimalSeed {
    private static var animals = [
        Animal(name: "Jr Dev aka Quebra-Galho", breed: "Unkown", species: "Developer", weight: 80.0, imageName: K.Images.developerImageName),
        Animal(name: "Twitter", breed: "Twitter", species: "Bird", weight: 5.0, imageName: K.Images.birdImageName),
        Animal(name: "Tom", breed: "Unknown", species: "Cat", weight: 12.0, imageName: K.Images.catImageName),
        Animal(name: "Mimosa", breed: "Dutch Cow", species: "Cow", weight: 200.0, imageName: K.Images.cowImageName),
        Animal(name: "Totó", breed: "Mongrel", species: "Dog", weight: 18.0, imageName: K.Images.dogImageName),
        Animal(name: "Dumbo", breed: "African Elephant", species: "Elephant", weight: 500.0, imageName: K.Images.elephantImageName),
        Animal(name: "Spidey", breed: "Domestic Spider", species: "Spider", weight: 1.0, imageName: K.Images.spiderImageName),
        Animal(name: "Peixe-Boi", breed: "Manatee", species: "Manatee", weight: 120.0, imageName: K.Images.manateeImageName),
        Animal(name: "Tiger", breed: "Bengali Tiger", species: "Tiger", weight: 150.0, imageName: K.Images.tigerImageName),
        Animal(name: "Michaelangelo", breed: "Aquatic Turtle", species: "Turtle", weight: 15.0, imageName: K.Images.turtleImageName)
    ]
    
    static func seed() -> [Animal] {
        return self.animals
    }
}
