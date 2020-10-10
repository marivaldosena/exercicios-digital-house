//
//  ComposerDetailViewController.swift
//  Exercicios
//
//  Created by Marivaldo Sena on 09/10/20.
//

import UIKit

class ComposerDetailViewController: UIViewController {
    @IBOutlet weak var composerNameLabel: UILabel?
    @IBOutlet weak var composerBirthDateLabel: UILabel?
    @IBOutlet weak var composerDeathDateLabel: UILabel?
    @IBOutlet weak var composerImageView: UIImageView?
    @IBOutlet weak var composerProfileDescriptionTextView: UITextView?
    
    private var repository: ComposerRepository?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.updateUIInterface()
    }
    
    @IBAction func deleteButtonPressed(_ sender: UIButton) {
        let alert = UIAlertController(title: "Delete Composer", message: "Do you really want to delete this composer?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action) in
            print(action.style)
        }))
        alert.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { (action) in
            print(action.style)
        }))
        present(alert, animated: true, completion: nil)
    }
    
    func setRepository(repository: ComposerRepository) {
        self.repository = repository
    }
    
    func getRepository() -> ComposerRepository? {
        return self.repository
    }
}
