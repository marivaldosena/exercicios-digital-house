//
//  CarDetailViewController.swift
//  Exercicios
//
//  Created by Marivaldo Sena on 07/10/20.
//

import UIKit

extension CarDetailViewController {
    static func getViewController() -> CarDetailViewController? {
        if let viewController = UIStoryboard(name: K.ViewNames.carDetailName, bundle: nil).instantiateInitialViewController() as? CarDetailViewController {
            return viewController
        }
        
        return nil
    }
    
    func goToCarDetail() {
        navigationController?.pushViewController(self, animated: true)
    }
    
    func goToRoot() {
        navigationController?.popToRootViewController(animated: true)
    }
    
    func setTitle(title: String) {
        self.title = title
    }
}

