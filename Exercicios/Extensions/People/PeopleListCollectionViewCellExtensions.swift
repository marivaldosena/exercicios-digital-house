//
//  PeopleListCollectionViewCellExtensions.swift
//  Exercicios
//
//  Created by Marivaldo Sena on 08/10/20.
//

import Foundation
import UIKit

extension PeopleListCollectionViewCell {
    static func getCellInstance(_ collectionView: UICollectionView, _ indexPath: IndexPath) -> PeopleListCollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.ViewNames.People.peopleCellName, for: indexPath) as! PeopleListCollectionViewCell
        
        return cell
    }
}
