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
    var imageName: String
    var starCount: Int
    
    
    init(title: String, category: String, image: String, starCount: Int) {
        self.title = title
        self.category = category
        self.imageName = image
        self.starCount = starCount
    }
}

extension Movie: Equatable {
    static func == (lhs: Movie, rhs: Movie) -> Bool {
        let isEqual = lhs.title == rhs.title && lhs.category == lhs.category
        
        return isEqual
    }
}
