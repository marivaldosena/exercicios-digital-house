//
//  ShowItemCellTableViewCell.swift
//  TV Maze Viewer
//
//  Created by Marivaldo Sena on 13/11/20.
//

import UIKit

class ShowItemCellTableViewCell: UITableViewCell {
    @IBOutlet weak var showNameLabel: UILabel!
        
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with item: Show) {
        self.clearFields()
        
        showNameLabel.text = item.name
    }
    
    private func clearFields() {
        showNameLabel.text = "Show Name"
    }
}
