//
//  CarListViewController.swift
//  Exercicios
//
//  Created by Marivaldo Sena on 05/10/20.
//

import UIKit

class CarListViewController: UIViewController {
    @IBOutlet weak var carCollectionView: UICollectionView?
    private var repository: CarRepository = CarRepository()

    override func viewDidLoad() {
        carCollectionView?.delegate = self
        carCollectionView?.dataSource = self
        
        super.viewDidLoad()
    }
    
    func getRepository() -> CarRepository {
        return self.repository
    }
    
    func setRepository(repository: CarRepository) {
        self.repository = repository
    }
}
