//
//  Image.swift
//  TV Maze Viewer
//
//  Created by Marivaldo Sena on 13/11/20.
//

import Foundation

struct Image: Codable {
    var original: String
    var medium: String
    
    enum CodingKeys: String, CodingKey {
        case original
        case medium
    }
}
