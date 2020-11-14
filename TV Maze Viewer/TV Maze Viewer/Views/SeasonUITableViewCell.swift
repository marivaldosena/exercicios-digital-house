//
//  SeasonUITableViewCell.swift
//  TV Maze Viewer
//
//  Created by Marivaldo Sena on 13/11/20.
//

import UIKit

class SeasonUITableViewCell: UITableViewCell {
    @IBOutlet weak var seasonNameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with item: ItemProtocol) {
        self.clearFields()
        
        seasonNameLabel.text = item.name
    }
    
    private func clearFields() {
        seasonNameLabel.text = "Season Name"
    }
    
}
