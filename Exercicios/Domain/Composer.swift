//
//  Composer.swift
//  Exercicios
//
//  Created by Marivaldo Sena on 08/10/20.
//

import Foundation

struct Composer {
    var name: String
    var imageName: String?
    var birthDate: Int?
    var deathDate: Int?
    var profileDescription: String?
    
    init(name: String) {
        self.name = name
    }
    
    init(name: String, imageName: String) {
        self.init(name: name)
        self.imageName = imageName
    }
    
    init(name: String, imageName: String, birthDate: Int?, deathDate: Int?, profileDescription: String?) {
        self.init(name: name, imageName: imageName)
        self.birthDate = birthDate
        self.deathDate = deathDate
        self.profileDescription = profileDescription
    }
}
