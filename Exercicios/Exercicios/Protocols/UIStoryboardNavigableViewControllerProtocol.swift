//
//  UIViewControllerProtocol.swift
//  Exercicios
//
//  Created by Marivaldo Sena on 09/10/20.
//

import Foundation
import UIKit

protocol UIStoryboardNavigableViewControllerProtocol {
    associatedtype T
    static func getViewController() -> T?
}
