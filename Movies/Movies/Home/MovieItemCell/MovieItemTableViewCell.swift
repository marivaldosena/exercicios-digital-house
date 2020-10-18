//
//  MovieItemTableViewCell.swift
//  Movies
//
//  Created by Marivaldo Sena on 17/10/20.
//

import UIKit

class MovieItemTableViewCell: UITableViewCell, CustomTableViewCellProtocol {
    typealias Item = Movie
    
    @IBOutlet weak var movieImageView: UIImageView?
    @IBOutlet weak var movieTitleLabel: UILabel?
    @IBOutlet weak var movieCategoryLabel: UILabel?
    @IBOutlet weak var starCountButton: UIButton?
    
    private var starButtonIconName = "star"
    
    @IBAction func starCountButtonClicked(_ sender: UIButton) {
        self.favoriteMovie(nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func configure(with item: Movie?) {
        self.clearFields()
        
        guard let item = item else { return }
        
        movieImageView?.image = UIImage(named: item.imageName)
        movieTitleLabel?.text = item.title
        movieCategoryLabel?.text = item.category
        starCountButton?.setTitle("\(item.starCount)", for: .normal)
    }
    
    func clearFields() {
        movieImageView?.image = UIImage(systemName: "exclamationmark.square")
        movieTitleLabel?.text = "Movie Title"
        movieCategoryLabel?.text = "Category"
        starCountButton?.setTitle("0", for: .normal)
    }
    
    private func favoriteMovie(_ item: Movie?) {
        self.changeStarCountButtonIcon()
    }
    
    private func changeStarCountButtonIcon() {
        if self.starButtonIconName == "star" {
            self.starButtonIconName = "star.fill"
        } else {
            self.starButtonIconName = "star"
        }
        
        DispatchQueue.main.async {
            self.starCountButton?.imageView?.image = UIImage(systemName: self.starButtonIconName)
        }
    }
}
