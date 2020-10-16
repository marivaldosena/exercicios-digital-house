//
//  Project.swift
//  Exercicios
//
//  Created by Marivaldo Sena on 10/10/20.
//

import Foundation

struct Project {
    var name: String
    var url: String
    var stars: Int
    
    init(name: String, url: String, stars: Int) {
        self.name = name
        self.url = url
        self.stars = stars
    }
    
    init(name: String, url: String) {
        self.init(name: name, url: url, stars: 0)
    }
}
