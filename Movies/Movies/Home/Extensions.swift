//
//  Extensions.swift
//  Movies
//
//  Created by Marivaldo Sena on 18/10/20.
//

import Foundation
import UIKit

extension UIViewController {
    static func getControllerName() -> String {
        let controllerName = "\(String(describing: self).replacingOccurrences(of: "ViewController", with: ""))"
        
        return controllerName
    }
}
