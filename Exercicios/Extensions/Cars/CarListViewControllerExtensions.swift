//
//  CarListViewControllerExtensions.swift
//  Exercicios
//
//  Created by Marivaldo Sena on 07/10/20.
//

import UIKit

//MARK: - CarListViewController
extension CarListViewController {
    static func getNavigationController() -> UINavigationController? {
        guard let uiNavigationController = UIStoryboard(name: K.ViewNames.carListName, bundle: nil).instantiateInitialViewController() as? UINavigationController else {
            return nil
        }

        return uiNavigationController
    }
    
    static func getControllerView() -> CarListViewController? {
        guard let uiNavigationController = CarListViewController.getNavigationController() else {
            return nil
        }
        
        if let viewController = uiNavigationController.topViewController as? CarListViewController {
            return viewController
        }
        
        return nil
    }
    
    func goToCarDetail() {
        if let viewController = CarDetailViewController.getViewController() {
            let title = self.getRepository().getSelectedCar()?.carName ?? ""
            viewController.setTitle(title: title)
            
            viewController.goToCarDetail()
        }
    }
    
    func goToRoot() {
        dismiss(animated: true, completion: nil)
    }
    
    func setSelectedCar(car: Car?) {
        self.getRepository().setSelectedCar(car: car)
        
        if let viewController = CarDetailViewController.getViewController() {
            viewController.setRepository(repository: self.getRepository())
            
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
}

//MARK: - CarListViewController: UICollectionViewDelegate
extension CarListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let car = self.getRepository().getCar(at: indexPath.row)
        self.setSelectedCar(car: car)
            
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}

//MARK: - CarListViewController: UICollectionViewDataSource
extension CarListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.getRepository().getNumberOfCars()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = CarListCollectionViewCell.getCellInstance(collectionView, indexPath)
        let car = self.getRepository().getCar(at: indexPath.row)
        cell.setup(car: car)
        
        return cell
    }
}
