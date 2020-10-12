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
        let filteredList = self.getRepository().getAll().filter{ (item) in
            return item is Developer
        }
        
        self.updatePeopleTable(filteredList)
    }
    
    private func showOnlyLaypeopleInPeopleList() {
        let filteredList = self.getRepository().getAll().filter{ !($0 is Developer) }
        
        self.updatePeopleTable(filteredList)
    }
    
    private func showAllInPeopleList() {
        let filteredList = self.getRepository().getAll()
        
        self.updatePeopleTable(filteredList)
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
