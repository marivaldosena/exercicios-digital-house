//
//  ViewControllerExtensions.swift
//  Exercicios
//
//  Created by Marivaldo Sena on 05/10/20.
//

import UIKit

//MARK: - MainViewController
extension MainViewController {
    func goTo(app: App?) {
        switch app?.appName {
        case "Cars":
            self.goToCarList()
        case "Animals":
            self.goToAnimalList()
        case "Employees":
            self.goToEmployeesList()
        case "Composers":
            self.goToComposerList()
        default:
            break
        }
    }
    
    func goToEmployeesList() {
        if let viewController = EmployeeListViewController.getViewController() {
            present(viewController, animated: true, completion: nil)
        }
    }
    
    func goToAnimalList() {
        if let viewController = AnimalListViewController.getViewController() {
            present(viewController, animated: true, completion: nil)
        }
    }
    
    func goToCarList() {
//        if let viewController = CarListViewController.getViewController() {
//            if let parent = viewController.parent {
//                present(parent, animated: true, completion: nil)
//            }
//        }
        
        if let uiNavigationController = CarListViewController.getNavigationController() {
            present(uiNavigationController, animated: true, completion: nil)
        }
    }
    
    func goToComposerList() {
        if let viewController = ComposerListViewController.getViewController() {
            if let parent = viewController.parent {
                present(parent, animated: true, completion: nil)
            }
        }
        
//        if let uiNavigationController = PeopleListViewController.getNavigationController() {
//            present(uiNavigationController, animated: true, completion: nil)
//        }
    }
}

//MARK: - MainViewController: UICollectionViewDelegate
extension MainViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let app = self.getRepository().getItem(at: indexPath.row)
        
        goTo(app: app)
    }
}

//MARK: - MainViewController: UICollectionViewDataSource
extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.getRepository().getNumberOfItems()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = AppListCollectionViewCell.getCellInstance(collectionView, indexPath)
        
        let app = self.getRepository().getItem(at: indexPath.row)
        
        cell.setup(app: app)
        
        return cell
    }
}
