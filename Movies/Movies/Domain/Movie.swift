//
//  Movie.swift
//  Movies
//
//  Created by Marivaldo Sena on 18/10/20.
//

import Foundation

struct Movie {
    var title: String
    var category: String
    var image: String
    var starCount: Int
    
    
    init(title: String, category: String, image: String, starCount: Int) {
        self.title = title
        self.category = category
        self.image = image
        self.starCount = starCount
    }
}
