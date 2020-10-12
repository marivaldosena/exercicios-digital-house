//
//  Person.swift
//  Exercicios
//
//  Created by Marivaldo Sena on 10/10/20.
//

import Foundation

class Person {
    var name: String
    var imageName: String
    var profileUrl: String
    
    init(name: String, imageName: String, profileUrl: String) {
        self.name = name
        self.imageName = imageName
        self.profileUrl = profileUrl
    }
}
