//
//  CarListCollectionViewCell.swift
//  Exercicios
//
//  Created by Marivaldo Sena on 07/10/20.
//

import UIKit

class CarListCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var carImageView: UIImageView?
    @IBOutlet weak var carNameLabel: UILabel?
    
    func setup(car: Car?) {
        self.cleanFields()
        
        carImageView?.image = UIImage(named: car?.imageName ?? "")
        carNameLabel?.text = car?.carName
    }
    
    private func cleanFields() {
        carImageView?.image = UIImage(named: K.Images.Cars.defaultCarImageName)
        carNameLabel?.text = "No Car Available"
    }
}
