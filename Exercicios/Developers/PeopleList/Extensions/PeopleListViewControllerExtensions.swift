//
//  PeopleListViewControllerExtensions.swift
//  Exercicios
//
//  Created by Marivaldo Sena on 10/10/20.
//

import Foundation
import UIKit

//MARK: - PeopleListViewController: UIStoryboardNavigableViewControllerProtocol
extension PeopleListViewController: UIStoryboardNavigableViewControllerProtocol {
    typealias T = PeopleListViewController
    
    static func getViewController() -> PeopleListViewController? {
        guard let viewController = UIStoryboard(name: K.ViewNames.Developers.peopleListName, bundle: nil).instantiateInitialViewController() as? T else {
            return nil
        }
        
        return viewController
    }
    
    func updateUIInterface() {
        self.peopleTableView.reloadData()
    }
}

//MARK: - PeopleListViewController: UITableViewDelegate
extension PeopleListViewController: UITableViewDelegate {
}

//MARK: - PeopleListViewController: UITableViewDataSource
extension PeopleListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.getRepository().getNumberOfItems()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = PeopleListTableViewCell.getCellInstance(tableView, indexPath)
        
        return cell
    }
}
