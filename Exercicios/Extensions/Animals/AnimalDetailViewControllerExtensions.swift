//
//  AnimalDetailViewControllerExtensions.swift
//  Exercicios
//
//  Created by Marivaldo Sena on 05/10/20.
//

import UIKit

extension AnimalDetailViewController {
    static func getViewController() -> AnimalDetailViewController? {
        if let viewController = UIStoryboard(name: K.ViewNames.animalDetailName, bundle: nil).instantiateInitialViewController() as? AnimalDetailViewController {
            return viewController
        }
        
        return nil
    }
    
    func goToRoot() {
        dismiss(animated: true, completion: nil)
    }
    
    func openWebBrowser(url: String) {
        if let url = URL(string: url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    func updateUIInterface() {
        if let animal = self.getAnimalRepository()?.getActiveAnimal() {
            animalImageView?.image = UIImage(named: animal.imageName)
            animalNameLabel?.text = "Name: \(animal.name)"
            animalBreedLabel?.text = "Breed: \(animal.breed)"
            animalSpeciesLabel?.text = "Species: \(animal.species)"
            animalWeightLabel?.text = String(format: "Weight: %.1f", animal.weight)
        }
    }
}
