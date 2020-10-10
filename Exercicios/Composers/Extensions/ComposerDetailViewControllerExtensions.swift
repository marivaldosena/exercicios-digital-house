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
            deleteButton?.roundCorners(corners: [.topRight, .bottomLeft], radius: 40)
            
            composerNameLabel?.text = composer.name
            composerImageView?.image = UIImage(named: composer.imageName ?? "")
            composerBirthDateLabel?.text = "Birth: \(composer.birthDate ?? 0)"
            composerDeathDateLabel?.text = "Death:  \(composer.deathDate ?? 0)"
            composerProfileDescriptionTextView?.text = composer.profileDescription
        }
    }
    
    func deleteComposer(_ composer: Composer?) {
        askUserForDeletion()
    }
    
    private func askUserForDeletion() {
        DispatchQueue.main.async {
            let alert = AlertUtils.getAlertInstance(title: "Delete Composer", message: "Do you want to delete this composer permanently?", style: .alert)
            
            AlertUtils.addAction(alert, title: "Cancel", style: .cancel, handler: nil)
            AlertUtils.addAction(alert, title: "Sure. Why not?", style: .destructive, handler: { (action) in
                if action.style == .destructive {
                    self.deleteComposerPermanently()
                }
            })
            AlertUtils.showAlert(self, alert, animated: true, completion: nil)
        }
    }
    
    private func deleteComposerPermanently() {
        if let composer = self.getRepository()?.getActiveItem() {
            DispatchQueue.main.async {
                let alert = AlertUtils.getAlertInstance(title: "Composer Deleted", message: "The Classic Music lost \(composer.name) today! Again.", style: .alert)
                AlertUtils.addAction(alert, title: "OK", style: .default, handler: nil)
                AlertUtils.showAlert(self, alert, animated: true, completion: nil)
            }
            self.getRepository()?.setActiveItem(item: nil)
            self.getRepository()?.delete(item: composer)
            self.navigationController?.popToRootViewController(animated: true)
        }
    }
}
