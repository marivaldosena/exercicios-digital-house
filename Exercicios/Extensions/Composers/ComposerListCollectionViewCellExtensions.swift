//
//  PeopleListCollectionViewCellExtensions.swift
//  Exercicios
//
//  Created by Marivaldo Sena on 08/10/20.
//

import Foundation
import UIKit

extension ComposerListCollectionViewCell {
    static func getCellInstance(_ collectionView: UICollectionView, _ indexPath: IndexPath) -> ComposerListCollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.ViewNames.Composers.peopleCellName, for: indexPath) as! ComposerListCollectionViewCell
        
        return cell
    }
    
    func setup(person: Composer?) {
        self.clearFields()
        
        composerNameLabel?.text = person?.imageName
    }
    
    private func clearFields() {
        composerNameLabel?.text = ""
    }
}
