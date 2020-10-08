//
//  EmployeeListViewControllerExtensions.swift
//  Exercicios
//
//  Created by Marivaldo Sena on 05/10/20.
//

import UIKit

//MARK: - EmployeeListViewController
extension EmployeeListViewController {
    static func getViewController() -> EmployeeListViewController? {
        if let viewController = UIStoryboard(name: K.ViewNames.employeeListName, bundle: nil).instantiateInitialViewController() as? EmployeeListViewController {
            return viewController
        }
        
        return nil
    }
    
    func goToEmployeeDetail(employee: Employee) {
        if let viewController = EmployeeDetailViewController.getViewController() {
            viewController.setEmployee(employee: employee)
            present(viewController, animated: true, completion: nil)
        }
    }
    
    func goToRoot() {
        dismiss(animated: true, completion: nil)
    }
}

//MARK: - EmployeeListViewController: UITableViewDelegate
extension EmployeeListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let employee = self.getEmployeeRepository().getEmployee(at: indexPath.row) {
            self.goToEmployeeDetail(employee: employee)
        }
    }
    
    func updateHeroList() {
        employeeTableViewList.reloadData()
    }
}

//MARK: - EmployeeListViewController: UITableViewDataSource
extension EmployeeListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.getEmployees().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.ViewNames.employeeCellName, for: indexPath) as! EmployeeListTableViewCell
        
        var employee: Employee?
        
        if indexPath.row >= 0 {
            employee = self.getEmployees()[indexPath.row]
        }
        
        cell.setup(employee: employee)
        
        return cell
    }
}

//MARK: - EmployeeListViewController: UISearchBarDelegate
extension EmployeeListViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let term = searchBar.text ?? ""
        self.setEmployees(employees: self.searchBy(term: term))
        
        self.updateHeroList()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let term = searchBar.text ?? ""
        self.setEmployees(employees: self.searchBy(term: term))
        
        self.updateHeroList()
    }
    
    private func searchBy(term: String) -> [Employee] {
        if !term.isEmpty {
            return self.getEmployeeRepository().searchBy(term: term)
        }
        
        return self.getEmployeeRepository().getAllEmployees()
    }
}
