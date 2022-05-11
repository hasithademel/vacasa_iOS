//
//  UIView+Round.swift
//  Vacasa
//
//  Created by Hasitha De Mel on 11/05/22.
//

import Foundation
import UIKit

extension UIView {
    func round() {
        self.layer.cornerRadius = self.frame.width / 2
    }
}
