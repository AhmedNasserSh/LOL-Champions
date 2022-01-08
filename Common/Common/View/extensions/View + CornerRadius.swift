//
//  View + CornerRadius.swift
//  Home
//
//  Created by Ahmed Naser on 08/01/2022.
//

import Foundation
import SwiftUI

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}
