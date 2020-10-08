//
//  PeopleListViewControllerExtensions.swift
//  Exercicios
//
//  Created by Marivaldo Sena on 08/10/20.
//

import Foundation
import UIKit

extension PeopleListViewController {
    
}

extension PeopleListViewController: UICollectionViewDelegate {
}

extension PeopleListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.getRepository().getNumberOfItems()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = PeopleListCollectionViewCell.getCellInstance(collectionView, indexPath)
        
        return cell
    }
    
    
}
