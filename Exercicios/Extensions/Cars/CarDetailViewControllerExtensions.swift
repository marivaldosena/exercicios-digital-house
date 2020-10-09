//
//  CarDetailViewController.swift
//  Exercicios
//
//  Created by Marivaldo Sena on 07/10/20.
//

import UIKit

extension CarDetailViewController {
    static func getViewController() -> CarDetailViewController? {
        if let viewController = UIStoryboard(name: K.ViewNames.Cars.carDetailName, bundle: nil).instantiateInitialViewController() as? CarDetailViewController {
            return viewController
        }
        
        return nil
    }
    
    func goToCarDetail() {
        navigationController?.pushViewController(self, animated: true)
    }
    
    func goToRoot() {
        dismiss(animated: true, completion: nil)
    }
    
    func setTitle(title: String) {
        self.title = title
    }
    
    func updateUIInterface() {
        let car = self.getRepository()?.getSelectedCar()
        
        title = car?.carName ?? "Not Available"
        carImageView?.image = UIImage(named: car?.imageName ?? K.Images.Cars.defaultCarImageName)
        carNameLabel?.text = car?.carName ?? "Not Available"
    }
}

