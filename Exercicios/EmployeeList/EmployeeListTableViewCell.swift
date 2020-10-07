//
//  EmployeeListTableViewCell.swift
//  Exercicios
//
//  Created by Marivaldo Sena on 04/10/20.
//

import UIKit

class EmployeeListTableViewCell: UITableViewCell {
    @IBOutlet weak var employeeImageView: UIImageView!
    @IBOutlet weak var employeeNameLabel: UILabel!
    @IBOutlet weak var employeePositionLabel: UILabel!
    @IBOutlet weak var employeeEmailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(employee: Employee?) {
        self.clearFields()
        
        employeeImageView.image = UIImage(named: K.Images.employeeImageName)
        employeeNameLabel.text = employee?.name
        employeePositionLabel.text = employee?.position.rawValue
        employeeEmailLabel.text = employee?.email
    }
    
    private func clearFields() {
        employeeImageView.image = UIImage(named: "")
        employeeNameLabel.text = ""
        employeePositionLabel.text = ""
        employeeEmailLabel.text = ""
    }

}
