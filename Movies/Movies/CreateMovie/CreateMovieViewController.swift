//
//  MovieAddViewController.swift
//  Movies
//
//  Created by Marivaldo Sena on 18/10/20.
//

import UIKit

//MARK: - CreateMovieViewController: UIViewController
class CreateMovieViewController: UIViewController {
    @IBOutlet weak var movieNameLabel: UITextField?
    @IBOutlet weak var movieCategoryLabel: UITextField?
    @IBOutlet weak var saveButton: UIButton?
    
    @IBAction func saveMovie(_ sender: UIButton) {
        self.saveMovie(nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

//MARK: -
extension CreateMovieViewController {
    func saveMovie(_ item: Movie?) {
        print("Saving movie...")
    }
}

//MARK: - CreateMovieViewController
extension CreateMovieViewController {
    static func getViewController() -> CreateMovieViewController? {
        guard let viewController = UIStoryboard(name: self.getControllerName(), bundle: nil).instantiateInitialViewController() as? Self else {
            return nil
        }
        
        return viewController
    }
    
    private static func getControllerName() -> String {
        let controllerName = "\(String(describing: self).replacingOccurrences(of: "ViewController", with: ""))"
        
        return controllerName
    }
}
