//
//  ComposerDetailViewController.swift
//  Exercicios
//
//  Created by Marivaldo Sena on 09/10/20.
//

import UIKit

class ComposerDetailViewController: UIViewController {
    @IBOutlet weak var composerNameLabel: UILabel!
    @IBOutlet weak var composerBirthDateLabel: UILabel!
    @IBOutlet weak var composerDeathDateLabel: UILabel!
    @IBOutlet weak var composerImageView: UIImageView!
    @IBOutlet weak var composerProfileDescriptionTextView: UITextView!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        //Composer(name: <#T##String#>, imageName: <#T##String#>, birthDate: <#T##Int?#>, deathDate: <#T##Int?#>, profileDescription: <#T##String?#>)
        // Do any additional setup after loading the view.
    }
}
