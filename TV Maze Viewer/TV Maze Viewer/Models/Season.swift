//
//  SeasonModel.swift
//  TV Maze Viewer
//
//  Created by Marivaldo Sena on 13/11/20.
//

import Foundation

struct Season: Codable, ItemProtocol {
    var id: Int
    var name: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name = "premiereDate"
    }
}
