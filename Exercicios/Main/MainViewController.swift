//
//  ViewController.swift
//  Exercicios
//
//  Created by Marivaldo Sena on 04/10/20.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var appListCollectionView: UICollectionView?
    private var repository = AppRepository()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        repository.addAll(collection: AppSeed.seed())
        
        appListCollectionView?.delegate = self
        appListCollectionView?.dataSource = self
    }


    //FIXME: Remove this method. We are not using buttons anymore.
    @IBAction func goTo(_ sender: UIButton) {
        if let buttonTitle = sender.currentTitle {
            switch buttonTitle {
            case "View Employees":
                goToEmployeesList()
            case "View Animals":
                goToAnimalList()
            case "View Cars":
                goToCarList()
            default:
                break
            }
        }
    }
    
    func getRepository() -> AppRepository {
        return self.repository
    }
}
