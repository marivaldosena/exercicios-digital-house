//
//  EmployeeDetailViewControllerExtensions.swift
//  Exercicios
//
//  Created by Marivaldo Sena on 05/10/20.
//

import UIKit

extension EmployeeDetailViewController {
    static func getViewController() -> EmployeeDetailViewController? {
        if let viewController = UIStoryboard(name: K.ViewNames.Employees.employeeDetailName, bundle: nil).instantiateInitialViewController() as? EmployeeDetailViewController {
            return viewController
        }
        
        return nil
    }
}
