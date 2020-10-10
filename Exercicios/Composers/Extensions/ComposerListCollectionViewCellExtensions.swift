//
//  PeopleListCollectionViewCellExtensions.swift
//  Exercicios
//
//  Created by Marivaldo Sena on 08/10/20.
//

import Foundation
import UIKit

extension ComposerListCollectionViewCell: CustomUICollectionCellProtocol {
    typealias T = ComposerListCollectionViewCell
    typealias I = Composer
    
    static func getCellInstance(_ collectionView: UICollectionView, _ indexPath: IndexPath) -> ComposerListCollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.ViewNames.Composers.composerCellName, for: indexPath) as! T
        
        return cell
    }

    func setup(item: I?) {
        self.clearFields()

        composerNameLabel?.text = item?.imageName
    }

    func clearFields() {
        composerNameLabel?.text = ""
    }
}
