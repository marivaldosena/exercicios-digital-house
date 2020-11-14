//
//  TVMazeService.swift
//  TV Maze Viewer
//
//  Created by Marivaldo Sena on 13/11/20.
//

import Foundation
import Alamofire

protocol ServiceUpdateDataDelegate {
    func didUpdateData(_ service: TVMazeService, itemsList: [ItemProtocol])
    func didFailWithErrors(error: Error)
}

struct TVMazeService {
    typealias Generic = ItemProtocol
    typealias Service = TVMazeService
    
    var delegate: ServiceUpdateDataDelegate?
    static var shared = TVMazeService()
    
    private var itemsList: [ItemProtocol] = []
    private var showsList: [Show] = []
    private let baseUrl = "https://api.tvmaze.com/shows?page=1"

    static func getAllShowsAvailable() {
        TVMazeService.shared.getAllShowsAvailable()
    }
    
    func getAllShowsAvailable() {
        AF.request(TVMazeService.shared.baseUrl).responseJSON { (response) in
            if let json = response.data {
                let decoder = JSONDecoder()
                
               do {
                    TVMazeService.shared.showsList = try decoder.decode([Show].self, from: json)
                TVMazeService.shared.delegate?.didUpdateData(TVMazeService.shared, itemsList: TVMazeService.shared.showsList)
                } catch {
                    fatalError(error.localizedDescription)
                }
            }
        }
    }
}
