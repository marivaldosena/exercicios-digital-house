//
//  AppListCollectionViewCellExtensions.swift
//  Exercicios
//
//  Created by Marivaldo Sena on 09/10/20.
//

import Foundation
import UIKit

extension AppListCollectionViewCell {
    static func getCellInstance(_ collectionView: UICollectionView, _ indexPath: IndexPath) -> AppListCollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.ViewNames.Main.appListCell, for: indexPath) as! AppListCollectionViewCell
        
        return cell
    }
    
    func setup(app: App?) {
        self.cleanFields()
        
        appImageView?.image = UIImage(named: "AppleStore")
        appNameLabel?.text = app?.appName
        appDescriptionTextView?.text = app?.description
    }
    
    private func cleanFields() {
        appImageView?.image = UIImage(named: "AppleStore")
        appNameLabel?.text = "App Name"
        appDescriptionTextView?.text = "App Description"
    }
}
