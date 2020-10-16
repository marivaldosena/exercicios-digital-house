//
//  PeopleListViewController.swift
//  Exercicios
//
//  Created by Marivaldo Sena on 10/10/20.
//

import UIKit

class PeopleListViewController: UIViewController {
    @IBOutlet weak var optionsSegmentedButton: UISegmentedControl!
    @IBOutlet weak var peopleTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var sortingOptionPickerView: UIPickerView!
    
    private var repository = PeopleRepository()
    private var service = PeopleService()
    private var filteredOption: Int = PeopleTableVisibilityOption.all
    
    private var filteredList = [Person]()
    private var sortingOptions = [
        ["Name", "Profile URL"],
        ["Asc", "Desc"]
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        peopleTableView.register(UINib(nibName: K.ViewNames.Developers.peopleCellName, bundle: nil), forCellReuseIdentifier: K.ViewNames.Developers.peopleCellName)

        peopleTableView.delegate = self
        peopleTableView.dataSource = self
        searchBar.delegate = self
        
        sortingOptionPickerView.delegate = self
        sortingOptionPickerView.dataSource = self
        
        self.downloadData()
        self.updateUIInterface()
    }
    
    @IBAction func onOptionsSegmentButtonChanged(_ sender: UISegmentedControl) {
        self.filterPeopleList(option: sender.selectedSegmentIndex)
    }
    
    func getRepository() -> PeopleRepository {
        return self.repository
    }
    
    func setRepository(repository: PeopleRepository) {
        self.repository = repository
    }
    
    func getService() -> PeopleService {
        return self.service
    }
    
    func setService(service: PeopleService) {
        self.service = service
    }
    
    func getFilteredList() -> [Person] {
        return filteredList
    }
    
    func setFilteredList(_ collection: [Person]) {
        self.filteredList = collection
    }
    
    func getFilteredOption() -> Int {
        return self.filteredOption
    }
    
    func setFilteredOption(option: Int) {
        self.filteredOption = option
    }
    
    func getSortingOption() -> [[String]] {
        return self.sortingOptions
    }
}

