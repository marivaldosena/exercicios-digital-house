//
//  ComposerDetailViewControllerExtensions.swift
//  Exercicios
//
//  Created by Marivaldo Sena on 09/10/20.
//

import Foundation
import UIKit

extension ComposerDetailViewController: UIStoryboardNavigableViewControllerProtocol {
    typealias T = ComposerDetailViewController
    
    static func getViewController() -> ComposerDetailViewController? {
        guard let viewController = UIStoryboard(name: K.ViewNames.Composers.composerDetailName, bundle: nil).instantiateInitialViewController() as? T else {
            return nil
        }
        
        return viewController
    }
    
    func updateUIInterface() {
        if let composer = self.getRepository()?.getActiveItem() {
            composerNameLabel?.text = composer.name
            composerImageView?.image = UIImage(named: composer.imageName ?? "")
            composerBirthDateLabel?.text = "Birth: \(composer.birthDate ?? 0)"
            composerDeathDateLabel?.text = "Death:  \(composer.deathDate ?? 0)"
            composerProfileDescriptionTextView?.text = composer.profileDescription
        }
    }
}
