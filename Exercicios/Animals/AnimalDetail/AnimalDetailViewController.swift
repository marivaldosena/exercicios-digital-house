//
//  AnimalDetailViewController.swift
//  Exercicios
//
//  Created by Marivaldo Sena on 05/10/20.
//

import UIKit

class AnimalDetailViewController: UIViewController {
    
    @IBOutlet weak var animalImageView: UIImageView?
    @IBOutlet weak var animalNameLabel: UILabel?
    @IBOutlet weak var animalBreedLabel: UILabel?
    @IBOutlet weak var animalSpeciesLabel: UILabel?
    @IBOutlet weak var animalWeightLabel: UILabel?
    
    private var animalRepository: AnimalRepository?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.updateUIInterface()
    }

    @IBAction func goTo(_ sender: UIButton) {
        switch sender.currentTitle {
        case "Back":
            self.goToRoot()
        case "Still Curious?":
            let animal = self.getAnimalRepository()?.getActiveAnimal()
            self.openWebBrowser(url: "\(K.WebBrowser.searchEngineUrl)/search?q=\(animal?.species ?? K.WebBrowser.defaultSearchTerm)&safe=active&tbm=isch")
        default:
            print("Error")
        }
    }
    
    func setAnimalRepository(animalRepository: AnimalRepository) {
        self.animalRepository = animalRepository
    }
    
    func getAnimalRepository() -> AnimalRepository? {
        return self.animalRepository
    }
}
