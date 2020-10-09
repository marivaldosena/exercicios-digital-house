//
//  AnimalListViewControllerExtensions.swift
//  Exercicios
//
//  Created by Marivaldo Sena on 05/10/20.
//

import UIKit

//MARK: - AnimalListViewController
extension AnimalListViewController {
    static func getViewController() -> AnimalListViewController? {
        if let viewController = UIStoryboard(name: K.ViewNames.Animals.animalListName, bundle: nil).instantiateInitialViewController() as? AnimalListViewController {
            return viewController
        }
        
        return nil
    }
    
    func goToRoot() {
        dismiss(animated: true, completion: nil)
    }
    
    func goToAnimalDetail() {
        if let viewController = AnimalDetailViewController.getViewController() {
            viewController.setAnimalRepository(animalRepository: self.getAnimalRepository())
            present(viewController, animated: true, completion: nil)
        }
    }
    
    func updateUIInterface() {
        if let animal = self.getActiveAnimal() {
            animalImageView.image = UIImage(named: animal.imageName)
            animalNameLabel.text = "Name: \(animal.name)"
            animalBreedLabel.text = "Breed: \(animal.breed)"
            animalSpeciesLabel.text = "Species: \(animal.species)"
            animalWeightLabel.text = String(format: "Weight: %.1f", animal.weight)
        }
    }
    
    @objc func tapGestureHandler(gesture: UIGestureRecognizer) {
        if let imageView = gesture.view as? UIImageView {
            if imageView == animalImageView {
                self.goToAnimalDetail()
            }
        }
    }
}

//MARK: - AnimalListViewController: UITableViewDelegate
extension AnimalListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.setActiveAnimal(animal: self.getAnimalRepository().getAnimal(at: indexPath.row))
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

//MARK: - AnimalListViewController: UITableViewDataSource
extension AnimalListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.getAnimalRepository().getNumberOfAnimals()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.ViewNames.Animals.animalCellName, for: indexPath) as! AnimalListTableViewCell
        
        let animal = self.getAnimalRepository().getAnimal(at: indexPath.row)
        
        cell.setup(animal: animal)
        
        return cell
    }
}
