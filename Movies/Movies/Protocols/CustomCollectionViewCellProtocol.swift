//
//  CustomCollectionViewCellProtocol.swift
//  Movies
//
//  Created by Marivaldo Sena on 18/10/20.
//

import Foundation
import UIKit

protocol CustomCollectionViewCellProtocol {
    associatedtype Item
    
    func configure(with item: Item?) -> Void
    func clearFields() -> Void
}
