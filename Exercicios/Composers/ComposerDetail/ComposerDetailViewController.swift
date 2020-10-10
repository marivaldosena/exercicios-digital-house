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
    @IBOutlet weak var deleteButton: DeleteUIButton?
    
    private var repository: ComposerRepository?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.updateUIInterface()
    }
    
    @IBAction func deleteButtonPressed(_ sender: UIButton) {
        self.deleteComposer(self.getRepository()?.getActiveItem())
    }
    
    func setRepository(repository: ComposerRepository) {
        self.repository = repository
    }
    
    func getRepository() -> ComposerRepository? {
        return self.repository
    }
}
