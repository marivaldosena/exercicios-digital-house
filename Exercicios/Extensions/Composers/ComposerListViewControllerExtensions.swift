//
//  PeopleListViewControllerExtensions.swift
//  Exercicios
//
//  Created by Marivaldo Sena on 08/10/20.
//

import Foundation
import UIKit

//MARK: - ComposerListViewController
extension ComposerListViewController {
    static func getNavigationController() -> UINavigationController? {
        if let uiNavigationController = UIStoryboard(name: K.ViewNames.Composers.peopleListName, bundle: nil).instantiateInitialViewController() as? UINavigationController {
            return uiNavigationController
        }
        
        return nil
    }
    
    static func getViewController() -> ComposerListViewController? {
        guard let uiNavigationController = self.getNavigationController() else {
            return nil
        }
        
        guard let viewController = uiNavigationController.topViewController as? ComposerListViewController else {
            return nil
        }
        
        return viewController
    }
    
    func updateUIInterface() {
        composerListCollectionView?.reloadData()
    }
    
    func openWebEncyclopedia(term: String) {
        let url = "\(K.WebBrowser.webEncyclopediaUrl)/results?search_query=\(term)"
        
        if let url = URL(string: url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}

//MARK: - ComposerListViewController: UICollectionViewDelegate
extension ComposerListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.updateUIInterface()
    }
}

//MARK: - ComposerListViewController: UICollectionViewDataSource
extension ComposerListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.getRepository().getNumberOfItems()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = ComposerListCollectionViewCell.getCellInstance(collectionView, indexPath)
        let person = self.getRepository().getItem(at: indexPath.row)
        cell.setup(person: person)
        
        return cell
    }
}
