//
//  PeopleViewController.swift
//  Exercicios
//
//  Created by Marivaldo Sena on 08/10/20.
//

import UIKit

class PeopleListViewController: UIViewController {
    @IBOutlet weak var peopleListCollectionView: UICollectionView?
    private var repository: PeopleRepository = PeopleRepository()

    override func viewDidLoad() {
        super.viewDidLoad()

        peopleListCollectionView?.delegate = self
        peopleListCollectionView?.dataSource = self
    }
    
    func setRepository(repository: PeopleRepository) {
        self.repository = repository
    }
    
    func getRepository() -> PeopleRepository {
        return self.repository
    }
}
