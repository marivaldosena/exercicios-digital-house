//
//  PeopleListViewController.swift
//  Exercicios
//
//  Created by Marivaldo Sena on 10/10/20.
//

import UIKit

class PeopleListViewController: UIViewController {
    @IBOutlet weak var optionsSegmentedButton: UISegmentedControl!
    @IBOutlet weak var peopleTableView: UITableView!
    
    private var repository = PeopleRepository()

    override func viewDidLoad() {
        super.viewDidLoad()

        peopleTableView.delegate = self
        peopleTableView.dataSource = self
        
        let downloadTask = WebUtils.getDownloadDataTask(url: "https://stackoverflow.com/tags/list/topusers",  downloadHandler: self.downloadHandler)
        downloadTask?.resume()
        
        self.updateUIInterface()
    }
    
    func getRepository() -> PeopleRepository {
        return self.repository
    }
    
    func setRepository(repository: PeopleRepository) {
        self.repository = repository
    }
    
    private func downloadHandler(data: Data?, response: URLResponse?, error: Error?) -> Void {
        if let error = error {
            print("Error: \(error)")
        } else {
            if let response = response as? HTTPURLResponse {
                if let data = data {
                    print("Gotcha data!")
                    print(data)
                }
            }
        }
    }
}

