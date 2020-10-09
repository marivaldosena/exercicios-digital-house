//
//  CarListCollectionViewCell.swift
//  Exercicios
//
//  Created by Marivaldo Sena on 07/10/20.
//

import UIKit

extension CarListCollectionViewCell {
    static func getCellInstance(_ collectionView: UICollectionView, _ indexPath: IndexPath) -> CarListCollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.ViewNames.Cars.carCellName, for: indexPath) as! CarListCollectionViewCell
        
        return cell
    }
}
