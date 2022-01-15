//
//  Image + Bundle.swift
//  ChampionDetails
//
//  Created by Ahmed Naser on 15/01/2022.
//

import Foundation
import SwiftUI

extension Image {
    init(imageName: String) {
        self.init(imageName, bundle: Bundle(identifier: ChampionDetailsConstants.bundleID.rawValue))
    }
}

extension UIImage {
    convenience init(name: String) {
        self.init(named: name, in: Bundle(identifier: ChampionDetailsConstants.bundleID.rawValue), with: nil)!
    }
}
