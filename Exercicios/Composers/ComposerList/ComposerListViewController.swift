//
//  PeopleViewController.swift
//  Exercicios
//
//  Created by Marivaldo Sena on 08/10/20.
//

import UIKit

class ComposerListViewController: UIViewController {
    @IBOutlet weak var composerListCollectionView: UICollectionView?
    @IBOutlet weak var selectedComposerNameLabel: UILabel?
    @IBOutlet weak var videoStreamingPlatformImageView: UIImageView?
    @IBOutlet weak var webEncyclopediaImageView: UIImageView?
    @IBOutlet weak var seeDetailsImageView: UIImageView?
    
    private var repository: ComposerRepository = ComposerRepository()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.repository.addAll(collection: ComposerSeed.seed())
        self.updateUIInterface()
        self.addGestureHandlerToImages()

        composerListCollectionView?.delegate = self
        composerListCollectionView?.dataSource = self
    }
    
    @IBAction func goToRoot(_ sender: UIButton) {
        self.goToRoot()
    }
    
    func setRepository(repository: ComposerRepository) {
        self.repository = repository
    }
    
    func getRepository() -> ComposerRepository {
        return self.repository
    }
}
