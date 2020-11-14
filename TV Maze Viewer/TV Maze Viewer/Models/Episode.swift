//
//  EpisodeModel.swift
//  TV Maze Viewer
//
//  Created by Marivaldo Sena on 13/11/20.
//

import Foundation

struct Episode: Decodable, ItemProtocol {
    var id: Int
    var name: String
    let image: Image
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case image
    }
}
