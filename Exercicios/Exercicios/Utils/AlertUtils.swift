//
//  AlertUtils.swift
//  Exercicios
//
//  Created by Marivaldo Sena on 10/10/20.
//

import Foundation
import UIKit

struct AlertUtils {
    static func getAlertInstance(title: String?, message: String?, style: UIAlertController.Style) -> UIAlertController {
        let alert = UIAlertController.init(title: title, message: message, preferredStyle: style)
        
        return alert
    }
    
    static func addAction(_ alert: UIAlertController, title: String?, style: UIAlertAction.Style, handler: ((UIAlertAction) -> Void)?) {
        alert.addAction(UIAlertAction(title: title, style: style, handler: handler))
    }
    
    static func showAlert(_ viewController: UIViewController, _ alert: UIAlertController, animated: Bool, completion: (() -> Void)?) {
        viewController.present(alert, animated: animated, completion: completion)
    }
}
