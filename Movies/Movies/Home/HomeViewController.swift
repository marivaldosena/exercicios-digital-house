//
//  ViewController.swift
//  Hero
//
//  Created by Marivaldo Sena on 17/10/20.
//

import UIKit

//MARK: - HomeViewController: UIViewController
class HomeViewController: UIViewController {
    @IBOutlet weak var movieSearchBar: UISearchBar?
    @IBOutlet weak var addMovieBarButtonItem: UIBarButtonItem?
    @IBOutlet weak var movieTableView: UITableView?
    
    private var allMovies = [
        Movie(title: "Avengers: Endgame", category: "Action", image: "AvengersEndgame", starCount: 8),
        Movie(title: "Avengers: Infinity War", category: "Action", image: "AvengersInfinityWar", starCount: 8),
        Movie(title: "The Avengers", category: "Action", image: "Avengers", starCount: 8)
    ]
    
    private var filteredMovies: [Movie] = []
    
    @IBAction func addMovie(_ sender: UIBarButtonItem) {
        self.goToAddMovie()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        movieTableView?.delegate = self
        movieTableView?.dataSource = self
        
        movieTableView?.register(UINib(nibName: "MovieItemTableViewCell", bundle: nil), forCellReuseIdentifier: "MovieItemCell")
        
        filteredMovies.append(contentsOf: allMovies)
        
        movieSearchBar?.delegate = self
    }
}

//MARK: - HomeViewController
extension HomeViewController {
    func goToAddMovie() {
        guard let viewController = CreateMovieViewController.getViewController() else {
            return
        }
        
        navigationController?.pushViewController(viewController, animated: true)
    }
}

//MARK: - HomeViewController: UITableViewDelegate
extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let viewController = MovieDetailsViewController.getViewController() else {
            return
        }
        
        viewController.setMovieItem(filteredMovies[indexPath.row])
        navigationController?.pushViewController(viewController, animated: true)
    }
}

//MARK: -  HomeViewController: UITableViewDataSource
extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredMovies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieItemCell", for: indexPath) as! MovieItemTableViewCell
        
        let movie = filteredMovies[indexPath.row]
        
        cell.configure(with: movie)
        
        return cell
    }
}

extension HomeViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if let term = searchBar.text {
            self.doSearch(term: term)
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let term = searchBar.text else {
            return
        }
        
        self.doSearch(term: term)
    }
    
    private func doSearch(term: String) {
        filteredMovies = self.getFilteredMovies(term: term)
        
        movieTableView?.reloadData()
    }
    
    private func getFilteredMovies(term: String) -> [Movie] {
        if !term.isEmpty {
            return allMovies.filter { $0.title.lowercased().contains(term.lowercased()) }
        }
        
        return allMovies
    }
}
