//
//  ShowDetailViewController.swift
//  TV Maze Viewer
//
//  Created by Marivaldo Sena on 13/11/20.
//

import UIKit
import Kingfisher
import Alamofire

class ShowDetailViewController: UIViewController {
    @IBOutlet weak var seasonsTableView: UITableView!
    @IBOutlet weak var showImageView: UIImageView!
    @IBOutlet weak var showNameLabel: UILabel!
    
    var showModel: Show?
    var baseUrl = "https://api.tvmaze.com/shows"
    var seasonsArray: [Season] = []
    
    //ViewController <- ViewModel <- Repository <- Model
    // Repository <- Service

    override func viewDidLoad() {
        super.viewDidLoad()

        self.updateUIInterface()
        
        seasonsTableView.delegate = self
        seasonsTableView.dataSource = self
        
        seasonsTableView.register(UINib(nibName: "SeasonUITableViewCell", bundle: nil), forCellReuseIdentifier: "SeasonUITableViewCell")
        
        self.getAllSeasons()
        // Do any additional setup after loading the view.
    }
    
    static func getViewController() -> ShowDetailViewController? {
        guard let viewController = UIStoryboard(name: "ShowDetail", bundle: nil).instantiateInitialViewController() as? ShowDetailViewController else {
            return nil
        }
        
        return viewController
    }
    
    func setShowModel(_ item: Show?) {
        self.showModel = item
    }
    
    func getShowModel() -> Show? {
        return self.showModel
    }
    //Massive View Controller (Model View Controller)
    private func getAllSeasons() {
        if let show = showModel {
            let url = "\(baseUrl)/\(show.id)/seasons"
            print(url)
            
            AF.request(url).responseJSON { (response) in
                if let json = response.data {
                    let decoder = JSONDecoder()

                    do {
                        self.seasonsArray = try decoder.decode([Season].self, from: json)
                        print(self.seasonsArray[0])
                        self.seasonsTableView.reloadData()
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            }
        }
    }
    
    func updateUIInterface() {
        DispatchQueue.main.async {
            let imageUrl = self.showModel?.image.medium.replacingOccurrences(of: "http", with: "https")
            if let url = URL(string: imageUrl ?? "https://via.placeholder.com/350") {
                self.showImageView.kf.setImage(with: url)
            }
            self.showNameLabel.text = self.showModel?.name
            
        }
    }
}


extension ShowDetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension ShowDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return seasonsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SeasonUITableViewCell", for: indexPath) as! SeasonUITableViewCell
        
        let season = seasonsArray[indexPath.row]
        cell.configure(with: season)
        
        return cell
    }
    
    
}
