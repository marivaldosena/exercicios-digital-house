//
//  MovieDetailsViewController.swift
//  Movies
//
//  Created by Marivaldo Sena on 18/10/20.
//

import UIKit

//MARK: - MovieDetailsViewController: UIViewController
class MovieDetailsViewController: UIViewController {
    @IBOutlet weak var movieTitleLabel: UILabel?
    @IBOutlet weak var movieImageView: UIImageView?
    @IBOutlet weak var relatedMoviesCollectionView: UICollectionView?
    
    private var movieItem: Movie?
    private var relatedMovies: [Movie] = [
        Movie(title: "Avengers: Infinity War", category: "Action", image: "AvengersInfinityWar", starCount: 8),
        Movie(title: "The Avengers", category: "Action", image: "Avengers", starCount: 8)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        relatedMoviesCollectionView?.delegate = self
        relatedMoviesCollectionView?.dataSource = self
        
        relatedMoviesCollectionView?.register(UINib(nibName: "RelatedMovieCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "RelatedMovieCell")
    }
    
    func getMovieItem() -> Movie? {
        return self.movieItem
    }
    
    func setMovieItem(_ movie: Movie?) {
        self.movieItem = movie
        self.setTitle(movie?.title ?? "Movie")
        self.updateUIInterface()
    }
    
    private func setTitle(_ title: String) {
        self.title = title
    }
}

//MARK: - MovieDetailsViewController
extension MovieDetailsViewController {
    func updateUIInterface() {
        guard let movie = movieItem else {
            DispatchQueue.main.async {
                self.setTitle("Movie")
                self.movieTitleLabel?.text = "Movie"
                self.movieImageView?.image = UIImage(systemName: "exclamationmark.square")
            }
            return
        }
        
        DispatchQueue.main.async {
            self.movieTitleLabel?.text = movie.title
            self.movieImageView?.image = UIImage(named: movie.imageName)
        }
    }
}

//MARK: - MovieDetailsViewController: NavigableViewControllerProtocol
extension MovieDetailsViewController: NavigableViewControllerProtocol {
    typealias T = MovieDetailsViewController
    
    static func getViewController() -> MovieDetailsViewController? {
        if let viewController = UIStoryboard(name: self.getControllerName(), bundle: nil).instantiateInitialViewController() as? T {
            return viewController
        }
        
        return nil
    }
}

//MARK: -
extension MovieDetailsViewController: UICollectionViewDelegate {
}

extension MovieDetailsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return relatedMovies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RelatedMovieCell", for: indexPath) as! RelatedMovieCollectionViewCell
        
        cell.configure(with: relatedMovies[indexPath.row])
        
        return cell
    }
    
    
}
