//
//  Image + bundle.swift
//  Home
//
//  Created by Ahmed Naser on 08/01/2022.
//

import Foundation
import SwiftUI

extension Image {
    init(imageName: String) {
        self.init(imageName, bundle: Bundle(identifier: Constants.bundleID.rawValue))
    }
}
