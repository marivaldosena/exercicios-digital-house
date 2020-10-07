//
//  AnimalsListViewController.swift
//  Exercicios
//
//  Created by Marivaldo Sena on 05/10/20.
//

import UIKit

class AnimalListViewController: UIViewController {
    @IBOutlet weak var animalTableViewList: UITableView!
    @IBOutlet weak var animalImageView: UIImageView!
    @IBOutlet weak var animalNameLabel: UILabel!
    @IBOutlet weak var animalBreedLabel: UILabel!
    @IBOutlet weak var animalSpeciesLabel: UILabel!
    @IBOutlet weak var animalWeightLabel: UILabel!
    
    private var animalRepository: AnimalRepository = AnimalRepository()
    private var activeAnimal: Animal?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animalTableViewList.delegate = self
        animalTableViewList.dataSource = self
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.tapGestureHandler(gesture:)))
        animalImageView.addGestureRecognizer(tapGesture)
        animalImageView.isUserInteractionEnabled = true
        
        self.animalRepository.addAnimals(animals: AnimalSeed.seed())
        self.setActiveAnimal(animal: self.getRandomAnimal())
    }
    
    @IBAction func goTo(_ sender: UIButton) {
        switch sender.currentTitle {
        case "Back":
            goToRoot()
        default:
            print("Error")
        }
    }
    
    func getAnimalRepository() -> AnimalRepository {
        return self.animalRepository
    }
    
    func setActiveAnimal(animal: Animal?) {
        self.animalRepository.setActiveAnimal(activeAnimal: animal)
        self.updateUIInterface()
    }
    
    func getActiveAnimal() -> Animal? {
        return self.animalRepository.getActiveAnimal()
    }
    
    func getRandomAnimal() -> Animal? {
        return self.animalRepository.getRandomAnimal()
    }
}
