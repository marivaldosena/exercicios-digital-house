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
//        if let viewController = CarListViewController.getViewController() {
//            if let parent = viewController.parent {
//                present(parent, animated: true, completion: nil)
//            }
//        }
        
        if let uiNavigationController = CarListViewController.getNavigationController() {
            present(uiNavigationController, animated: true, completion: nil)
        }
    }
    
    func goToComposerList() {
        if let viewController = ComposerListViewController.getViewController() {
            if let parent = viewController.parent {
                present(parent, animated: true, completion: nil)
            }
        }
        
//        if let uiNavigationController = PeopleListViewController.getNavigationController() {
//            present(uiNavigationController, animated: true, completion: nil)
//        }
    }
}
