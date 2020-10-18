//
//  RelatedMovieCollectionViewCell.swift
//  Movies
//
//  Created by Marivaldo Sena on 18/10/20.
//

import UIKit

class RelatedMovieCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var movieTitleLabel: UILabel?
    @IBOutlet weak var movieImageView: UIImageView?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}

extension RelatedMovieCollectionViewCell: CustomCollectionViewCellProtocol {
    typealias Item = Movie
    
    func configure(with item: Movie?) {
        guard let movie = item else {
            self.clearFields()
            return
        }
        
        DispatchQueue.main.async {
            self.movieImageView?.image = UIImage(named: movie.imageName)
            self.movieTitleLabel?.text = movie.title
        }
    }
    
    func clearFields() {
        DispatchQueue.main.async {
            self.movieImageView?.image = UIImage(systemName: "exclamationmark.square")
            self.movieTitleLabel?.text = "Movie"
        }
    }
}
