//
//  ViewControllerExtensions.swift
//  Exercicios
//
//  Created by Marivaldo Sena on 05/10/20.
//

import UIKit

extension ViewController {
    func goToEmployeesList() {
        if let viewController = EmployeeListViewController.getViewController() {
            present(viewController, animated: true, completion: nil)
        }
    }
    
    func goToAnimalList() {
        if let viewController = AnimalListViewController.getViewController() {
            present(viewController, animated: true, completion: nil)
        }
    }
    
    func goToCarList() {
        if let viewController = CarListViewController.getControllerView() {
            present(viewController, animated: true, completion: nil)
        }
    }
}
