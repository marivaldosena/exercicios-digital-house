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
        
        self.updateUIInterface()
    }
    
    func getRepository() -> PeopleRepository {
        return self.repository
    }
    
    func setRepository(repository: PeopleRepository) {
        self.repository = repository
    }
}

