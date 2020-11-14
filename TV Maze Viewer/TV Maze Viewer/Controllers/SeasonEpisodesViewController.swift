//
//  SeasonEpisodesViewController.swift
//  TV Maze Viewer
//
//  Created by Marivaldo Sena on 13/11/20.
//

import UIKit
import Alamofire

class SeasonEpisodesViewController: UIViewController {
    @IBOutlet weak var episodesTableView: UITableView!
    
    private var seasonModel: Season?
    private var episodesArray: [Episode] = []
    
    let baseUrl = "https://api.tvmaze.com/seasons"

    override func viewDidLoad() {
        super.viewDidLoad()

        episodesTableView.delegate = self
        episodesTableView.dataSource = self
        
        episodesTableView.register(UINib(nibName: "SeasonUITableViewCell", bundle: nil), forCellReuseIdentifier: "SeasonUITableViewCell")
        
        self.getAllEpisodes()
    }
    
    func setSeason(_ season: Season?) {
        self.seasonModel = season
    }
    
    func getSeason() -> Season? {
        return self.seasonModel
    }
    
    private func getAllEpisodes() {
        if let season = seasonModel {
            let url = "\(baseUrl)/\(season.id)/seasons"
            
            AF.request(url).responseJSON { (response) in
                if let json = response.data {
                    let decoder = JSONDecoder()

                    do {
                        self.episodesArray = try decoder.decode([Episode].self, from: json)
                        print(self.episodesArray)
                        self.episodesTableView.reloadData()
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            }
        }
    }

    func updateUIInterface() {
        DispatchQueue.main.async {
            
        }
    }

}



extension SeasonEpisodesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension SeasonEpisodesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return episodesArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SeasonUITableViewCell", for: indexPath) as! SeasonUITableViewCell
        
        let episode = episodesArray[indexPath.row]
        cell.configure(with: episode)
        
        return cell
    }
}
