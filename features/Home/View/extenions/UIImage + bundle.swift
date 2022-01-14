//
//  UIImage + bundle.swift
//  Home
//
//  Created by Ahmed Naser on 14/01/2022.
//

import Foundation
import UIKit

extension UIImage {
    convenience init(name: String) {
        self.init(named: name, in: Bundle(identifier: Constants.bundleID.rawValue), with: nil)!
    }
}
