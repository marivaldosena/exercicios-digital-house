//
//  PeopleListTableViewCell.swift
//  Exercicios
//
//  Created by Marivaldo Sena on 10/10/20.
//

import UIKit

//MARK: - PeopleListTableViewCell: UITableViewCell
class PeopleListTableViewCell: UITableViewCell {
    @IBOutlet weak var personImageView: UIImageView?
    @IBOutlet weak var personNameLabel: UILabel?
    @IBOutlet weak var profileUrlLabel: UILabel?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
}

//MARK: - PeopleListTableViewCell: CustomUITableViewCellProtocol
extension PeopleListTableViewCell: CustomUITableViewCellProtocol {
    typealias T = PeopleListTableViewCell
    typealias I = Person
    
    static func getCellInstance(_ tableView: UITableView, _ indexPath: IndexPath) -> PeopleListTableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.ViewNames.Developers.peopleCellName, for: indexPath) as! T
        
        return cell
    }
    
    func setup(item: Person?) {
        self.clearFields()
        
        guard let person = item else {
            return
        }
        
        DispatchQueue.main.async {
            WebUtils.getImage(imageUrl: person.imageName, fallbackImage: K.Images.Developers.fallBackImageName, callback: self.handleDownloadTask)
        }
        //self.personImageView?.image = WebUtils.getImage(imageUrl: person.imageName, fallbackImageName: K.Images.Developers.fallBackImageName)
        self.personImageView?.image = UIImage(systemName: "person.circle")
        self.personNameLabel?.text = person.name
        self.profileUrlLabel?.text = person.profileUrl
    }
    
    func clearFields() {
        personImageView?.image = UIImage(systemName: K.Images.Developers.fallBackImageName)
        personNameLabel?.text = ""
        profileUrlLabel?.text = ""
    }
    
    private func handleDownloadTask(data: Data?, response: URLResponse?, error: Error?) {
        guard let error = error else {
            if let response = response as? HTTPURLResponse {
                if response.statusCode >= 200 && response.statusCode < 300 {
                    if let data = data {
                        DispatchQueue.main.async {
                            self.personImageView?.image = UIImage(data: data)
                        }
                    }
                }
            }
            return
        }
        
        print("Error: \(error)")
    }
}
