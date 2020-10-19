//
//  MovieAddViewController.swift
//  Movies
//
//  Created by Marivaldo Sena on 18/10/20.
//

import UIKit

//MARK: - CreateMovieViewController: UIViewController
class CreateMovieViewController: UIViewController {
    @IBOutlet weak var movieNameTextField: UITextField?
    @IBOutlet weak var movieCategoryTextField: UITextField?
    @IBOutlet weak var saveButton: UIButton?
    
    private var movieManager = MovieManager.getManagerInstance()
    
    @IBAction func saveMovie(_ sender: UIButton) {
        if let movieTitle = movieNameTextField?.text, let movieCategory = movieCategoryTextField?.text {
            if !movieTitle.isEmpty  && !movieCategory.isEmpty {
                let movie = Movie(title: movieTitle, category: movieCategory, image: "flame", starCount: 0)
                self.saveMovie(movie)
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

//MARK: - CreateMovieViewController
extension CreateMovieViewController {
    func saveMovie(_ item: Movie?) {
        movieManager.add(item)
        
        navigationController?.popToRootViewController(animated: true)
    }
}

//MARK: - CreateMovieViewController: NavigableViewController
extension CreateMovieViewController: NavigableViewControllerProtocol {
    typealias T = CreateMovieViewController
    static func getViewController() -> T? {
        guard let viewController = UIStoryboard(name: self.getControllerName(), bundle: nil).instantiateInitialViewController() as? T else {
            return nil
        }
        
        return viewController
    }
}
