//
//  DeleteUIButton.swift
//  Exercicios
//
//  Created by Marivaldo Sena on 09/10/20.
//

import UIKit

class DeleteUIButton: UIButton {
    fileprivate func roundCorners(corners: UIRectCorner, radius: Int = 8) {
        let maskPath1 = UIBezierPath(roundedRect: bounds,
                                     byRoundingCorners: corners,
                                     cornerRadii: CGSize(width: radius, height: radius))
        let maskLayer1 = CAShapeLayer()
        maskLayer1.frame = bounds
        maskLayer1.path = maskPath1.cgPath
        layer.mask = maskLayer1
    }
    
    private func updateCornerRadius() {
        var cornersToUpdate: UIRectCorner = UIRectCorner()
     
        if topRightCornerRadius > 0.0 {
            cornersToUpdate.insert(.topRight)
        } else {
            cornersToUpdate.remove(.topRight)
        }
        
        if topLeftCornerRadius > 0.0 {
            cornersToUpdate.insert(.topLeft)
        } else {
            cornersToUpdate.remove(.topLeft)
        }
        
        if bottomRightCornerRadius > 0.0 {
            cornersToUpdate.insert(.bottomRight)
        } else {
            cornersToUpdate.remove(.bottomRight)
        }
        
        if bottomLeftCornerRadius > 0.0 {
            cornersToUpdate.insert(.bottomLeft)
        } else {
            cornersToUpdate.remove(.bottomLeft)
        }
        
        self.roundCorners(corners: cornersToUpdate)
    }
    
    @IBInspectable var topRightCornerRadius: CGFloat = 0.0 {
        didSet {
            self.updateCornerRadius()
        }
    }
    
    @IBInspectable var topLeftCornerRadius: CGFloat = 0.0 {
        didSet {
            self.updateCornerRadius()
        }
    }
    
    @IBInspectable var bottomRightCornerRadius: CGFloat = 0.0 {
        didSet {
            self.updateCornerRadius()
        }
    }
    
    @IBInspectable var bottomLeftCornerRadius: CGFloat = 0.0 {
        didSet {
            self.updateCornerRadius()
        }
    }
}
