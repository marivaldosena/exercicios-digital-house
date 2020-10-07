//
//  AnimalListTableViewCell.swift
//  Exercicios
//
//  Created by Marivaldo Sena on 05/10/20.
//

import UIKit

class AnimalListTableViewCell: UITableViewCell {

    @IBOutlet weak var animalNameLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setup(animal: Animal?) {
        self.clearCell()
        
        animalNameLabel.text = animal?.name
    }
    
    private func clearCell() {
        animalNameLabel.text = ""
    }
}
