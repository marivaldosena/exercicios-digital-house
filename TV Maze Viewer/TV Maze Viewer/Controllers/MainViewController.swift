//
//  ViewController.swift
//  TV Maze Viewer
//
//  Created by Marivaldo Sena on 13/11/20.
//

import UIKit
import Alamofire

class MainViewController: UIViewController {
    @IBOutlet weak var showsTableView: UITableView!
    
    // Obter lista de programas
    // Obter season
    // Obter Episode
    
    var showsArray: [Show] = []
    let baseUrl = "https://api.tvmaze.com/shows?page=1"
    var service = TVMazeService.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        
        showsTableView.delegate = self
        showsTableView.dataSource = self
        service.delegate = self
        
        self.getAllAvailableShows()
    }
    
    private func getAllAvailableShows() {
        AF.request(baseUrl).responseJSON { (response) in
            if let json = response.data {
                let decoder = JSONDecoder()
                
               do {
                    self.showsArray = try decoder.decode([Show].self, from: json)
                    self.updateTable()
                } catch {
                    fatalError(error.localizedDescription)
                }
            }
        }
    }
}

extension MainViewController {
    func updateTable() {
        DispatchQueue.main.async {
            self.showsTableView.reloadData()
        }
    }
}

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let viewController = ShowDetailViewController.getViewController() {
            let showModel = showsArray[indexPath.row]
            viewController.title = showModel.name
            viewController.setShowModel(showModel)
            navigationController?.pushViewController(viewController, animated: true)
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return showsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShowItemCell", for: indexPath) as! ShowItemCellTableViewCell
        
        let item = showsArray[indexPath.row]
        cell.configure(with: item)
        
        return cell
    }
}

extension MainViewController: ServiceUpdateDataDelegate {
    func didUpdateData(_ service: TVMazeService, itemsList: [ItemProtocol]) {
        self.showsArray = itemsList as! [Show]
        self.updateTable()
    }
    
    func didFailWithErrors(error: Error) {
        print(error.localizedDescription)
    }
}
