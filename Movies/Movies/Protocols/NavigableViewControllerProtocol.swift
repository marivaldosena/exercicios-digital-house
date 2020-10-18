//
//  NavigableViewControllerProtocol.swift
//  Movies
//
//  Created by Marivaldo Sena on 18/10/20.
//

import Foundation
import UIKit

protocol NavigableViewControllerProtocol {
    associatedtype T
    
    static func getViewController() -> T?
}
