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
    
    private var movieManager = MovieManager.getManagerInstance()
    
    private var filteredMovies: [Movie] = []
    
    @IBAction func addMovie(_ sender: UIBarButtonItem) {
        self.goToAddMovie()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.movieManager.addAll(MovieSeed.seed())
        
        movieTableView?.delegate = self
        movieTableView?.dataSource = self
        
        movieTableView?.register(UINib(nibName: "MovieItemTableViewCell", bundle: nil), forCellReuseIdentifier: "MovieItemCell")
        
        filteredMovies.append(contentsOf: movieManager.getAll())
        
        movieSearchBar?.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.filteredMovies = movieManager.getAll()
        
        DispatchQueue.main.async {
            self.movieTableView?.reloadData()
        }
    }
}

//MARK: - HomeViewController
extension HomeViewController {
    func goToAddMovie() {
        guard let viewController = CreateMovieViewController.getViewController() else {
            return
        }
        
        //viewController.setMovieManager(self.movieManager)
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
            return self.movieManager.search(term: term)
        }
        
        return self.movieManager.getAll()
    }
}
