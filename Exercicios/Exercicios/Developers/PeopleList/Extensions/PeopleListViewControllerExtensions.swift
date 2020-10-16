//
//  PeopleListViewControllerExtensions.swift
//  Exercicios
//
//  Created by Marivaldo Sena on 10/10/20.
//

import Foundation
import UIKit
import SwiftSoup

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
        DispatchQueue.main.async {
            self.peopleTableView.reloadData()
        }
    }
    
    private func downloadPeopleHandler(data: Data?, response: URLResponse?, error: Error?) -> Void {
        if let error = error {
            print("Error: \(error)")
        } else {
            if let response = response as? HTTPURLResponse {
                if response.statusCode >= 200 && response.statusCode < 300  {
                    if let data = data {
                        let people = StackOverFlowProfileSerializer.fromHTMLToPeople(html: data)
                        self.updateRepository(people)
                    }
                }
            }
        }
    }
    
    private func downloadDeveloperHandler(data: Data?, response: URLResponse?, error: Error?) -> Void {
        guard let error = error else {
            guard let response = response as? HTTPURLResponse else {
                return
            }
            
            if response.statusCode >= 200 && response.statusCode < 300 {
                if let data = data {
                    let developers = GithubProfileSerializer.fromHTMLToDevelopers(html: data)
                    self.updateRepository(developers)
                }
            }
            
            return
        }
        
        print("Error: \(error)")
    }
    
    private func updatePeopleTable(_ collection: [Person]) {
        self.setFilteredList(collection)
        self.updateUIInterface()
    }
    
    private func updateRepository(_ collection: [Person]) {
        let repository = self.getRepository()
        
        repository.addAll(collection: collection)
        self.updatePeopleTable(repository.getAll())
    }
    
    func downloadData() {
        let downloadPeopleTask = WebUtils.getDownloadDataTask(url: "\(K.API.Developers.stackOverFlowBaseUrl)/tags/list/topusers",  downloadHandler: self.downloadPeopleHandler)
        downloadPeopleTask?.resume()
        
        let downloadDeveloperTask = WebUtils.getDownloadDataTask(url: K.API.Developers.mostActiveGithubUsersRankingUrl, downloadHandler: self.downloadDeveloperHandler)
        downloadDeveloperTask?.resume()
    }
    
    func filterPeopleList(option: Int) {
        switch option {
        case PeopleTableVisibilityOption.all:
            self.showAllInPeopleList()
        case PeopleTableVisibilityOption.onlyLaypeople:
            self.showOnlyLaypeopleInPeopleList()
        case PeopleTableVisibilityOption.onlyDevelopers:
            self.showOnlyDevelopersInPeopleList()
        default:
            self.showAllInPeopleList()
        }
    }
    
    private func showOnlyDevelopersInPeopleList() {
        let filteredList = self.getAllDevelopers()
        
        self.setFilteredOption(option: PeopleTableVisibilityOption.onlyDevelopers)
        self.updatePeopleTable(filteredList)
    }
    
    private func showOnlyLaypeopleInPeopleList() {
        let filteredList = self.getAllLaypeople()
        
        self.setFilteredOption(option: PeopleTableVisibilityOption.onlyLaypeople)
        self.updatePeopleTable(filteredList)
    }
    
    private func showAllInPeopleList() {
        let filteredList = self.getRepository().getAll()
        
        self.setFilteredOption(option: PeopleTableVisibilityOption.all)
        self.updatePeopleTable(filteredList)
    }
    
    private func getAllLaypeople() -> [Person] {
        return self.getRepository().getAll().filter{ !($0 is Developer) }
    }
    
    private func getAllDevelopers() -> [Person] {
        return self.getRepository().getAll().filter { $0 is Developer }
    }
}

//MARK: - PeopleListViewController: UITableViewDelegate
extension PeopleListViewController: UITableViewDelegate {
}

//MARK: - PeopleListViewController: UITableViewDataSource
extension PeopleListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.getFilteredList().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = PeopleListTableViewCell.getCellInstance(tableView, indexPath)
        
        let person = try? self.getFilteredList()[indexPath.row]
        cell.setup(item: person)
        return cell
    }
}

extension PeopleListViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard let term = searchBar.text else {
            return
        }
        
        self.doSearch(term: term)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let term = searchBar.text else {
            return
        }
        
        self.doSearch(term: term)
    }
    
    private func doSearch(term: String) {
        let option = self.getFilteredOption()
        var newList: [Person] = []
        
        switch option {
        case PeopleTableVisibilityOption.all:
            newList = self.searchByTermInAll(term: term)
        case PeopleTableVisibilityOption.onlyDevelopers:
            newList = self.searchByTermInDevelopers(term: term)
        case PeopleTableVisibilityOption.onlyLaypeople:
            newList = self.searchByTermInLaypeople(term: term)
        default:
            newList = self.searchByTermInAll(term: term)
        }
        
        self.updatePeopleTable(newList)
    }
    
    private func searchByTermInDevelopers(term: String) -> [Person] {
        if !term.isEmpty {
            let filteredList = self.getAllDevelopers().filter { $0.searchBy(term: term) }
        
            return filteredList
        }
        
        return self.getAllDevelopers()
    }
    
    private func searchByTermInLaypeople(term: String) -> [Person] {
        if !term.isEmpty {
            let filteredList = self.getAllLaypeople().filter { $0.searchBy(term: term) }
            
            return filteredList
        }
        return self.getAllLaypeople()
    }
    
    private func searchByTermInAll(term: String) -> [Person] {
        if !term.isEmpty {
            let result = self.getRepository().searchBy(term: term)
            
            return result
        }
        
        return self.getRepository().getAll()
    }
}

//MARK: - PeopleListViewController: UIPickerViewDelegate
extension PeopleListViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        let sortingStyle = self.getSelectedOption(pickerView)
        
        self.doSorting(sortingStyle: sortingStyle)
    }
    
    private func doSorting(sortingStyle: Int) {
        switch sortingStyle {
        case PeopleTableSortingOption.nameAscending:
            self.doSortByNameInAscendingOrder()
        case PeopleTableSortingOption.nameDescending:
            self.doSortByNameInDescendingOrder()
        case PeopleTableSortingOption.profileUrlAscending:
            self.doSortByProfileUrlInAscendingOrder()
        case PeopleTableSortingOption.profileUrlDescending:
            self.doSortByProfileUrlInDescendingOrder()
        default:
            self.doSortByNameInAscendingOrder()
        }
    }
    
    private func doSortByNameInAscendingOrder() {
        let newList = self.getFilteredList().sorted { $0 < $1 }
        
        self.updatePeopleTable(newList)
    }
    
    private func doSortByNameInDescendingOrder() {
        let newList = self.getFilteredList().sorted { $0 > $1 }
        
        self.updatePeopleTable(newList)
    }
    
    private func doSortByProfileUrlInAscendingOrder() {
        let newList = self.getFilteredList().sorted { $0.profileUrl < $1.profileUrl }
        
        self.updatePeopleTable(newList)
    }
    
    private func doSortByProfileUrlInDescendingOrder() {
        let newList = self.getFilteredList().sorted { $0.profileUrl > $1.profileUrl }
        
        self.updatePeopleTable(newList)
    }
    
    private func getSelectedOption(_ pickerView: UIPickerView) -> Int {
        let firstOption = pickerView.selectedRow(inComponent: 0)
        let secondOption = pickerView.selectedRow(inComponent: 1)
        
        let category = self.getSortingOption()[0][firstOption]
        let sorting = self.getSortingOption()[1][secondOption]
        
        var result: Int
        
        if category.contains("Profile") {
            if sorting.contains("Asc") {
                result = PeopleTableSortingOption.profileUrlAscending
            } else {
                result = PeopleTableSortingOption.profileUrlDescending
            }
        } else {
            if sorting.contains("Desc") {
                result = PeopleTableSortingOption.nameDescending
            } else {
                result = PeopleTableSortingOption.nameAscending
            }
        }
        
        return result
    }
}

extension PeopleListViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.getSortingOption()[component][row]
    }
}
