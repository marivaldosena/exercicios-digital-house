//
//  MovieSeed.swift
//  Movies
//
//  Created by Marivaldo Sena on 18/10/20.
//

import Foundation

struct MovieSeed {
    private static let items = [
        Movie(title: "Avengers: Endgame", category: "Action", image: "AvengersEndgame", starCount: 8),
        Movie(title: "Avengers: Infinity War", category: "Action", image: "AvengersInfinityWar", starCount: 8),
        Movie(title: "The Avengers", category: "Action", image: "Avengers", starCount: 8)
    ]
    
    static func seed() -> [Movie] {
        return items
    }
}
