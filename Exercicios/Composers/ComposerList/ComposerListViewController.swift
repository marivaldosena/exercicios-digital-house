//
//  PeopleViewController.swift
//  Exercicios
//
//  Created by Marivaldo Sena on 08/10/20.
//

import UIKit

class ComposerListViewController: UIViewController {
    @IBOutlet weak var composerListCollectionView: UICollectionView?
    
    private var repository: ComposerRepository = ComposerRepository()

    override func viewDidLoad() {
        super.viewDidLoad()

        composerListCollectionView?.delegate = self
        composerListCollectionView?.dataSource = self
    }
    
    func setRepository(repository: ComposerRepository) {
        self.repository = repository
    }
    
    func getRepository() -> ComposerRepository {
        return self.repository
    }
}
