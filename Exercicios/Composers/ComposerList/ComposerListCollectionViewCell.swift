//
//  PeopleListCollectionViewCell.swift
//  Exercicios
//
//  Created by Marivaldo Sena on 08/10/20.
//

import UIKit

class ComposerListCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var composerNameLabel: UILabel?
    
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
}
