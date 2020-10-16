//
//  CustomUICollectionCellProtocol.swift
//  Exercicios
//
//  Created by Marivaldo Sena on 09/10/20.
//

import Foundation
import UIKit

//MARK: - GenericCustomCellProtocol
protocol GenericCustomCellProtocol {
    associatedtype T
    associatedtype I
    
    func setup(item: I?)
    func clearFields()
}

//MARK: - CustomUICollectionCellProtocol: GenericCustomCellProtocol
protocol CustomUICollectionCellProtocol: GenericCustomCellProtocol {
    associatedtype T
    
    static func getCellInstance(_ collectionView: UICollectionView, _ indexPath: IndexPath) -> T
}

//MARK: - CustomUITableViewCellProtocol: GenericCustomCellProtocol
protocol CustomUITableViewCellProtocol: GenericCustomCellProtocol {
    associatedtype T
    
    static func getCellInstance(_ tableView: UITableView, _ indexPath: IndexPath) -> T
}
