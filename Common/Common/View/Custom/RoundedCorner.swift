//
//  RoundedCorner.swift
//  Home
//
//  Created by Ahmed Naser on 08/01/2022.
//

import Foundation
import SwiftUI

struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let cornerSize = CGSize(width: radius, height: radius)
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: cornerSize)
        return Path(path.cgPath)
    }
}
