//
//  ScrollUIView.swift
//  Common
//
//  Created by Ahmed Naser on 09/01/2022.
//

import SwiftUI
import UIKit

public struct ScrollViewUI<Content: View>: UIViewControllerRepresentable {

    public var content: () -> Content
    public var hideScrollIndicators: Bool = false

    public init(hideScrollIndicators: Bool, @ViewBuilder content: @escaping () -> Content) {
        self.content = content
        self.hideScrollIndicators = hideScrollIndicators
    }

    public func makeUIViewController(context: Context) -> ScrollViewController<Content> {
        let scrollVC = ScrollViewController(rootView: self.content())
        scrollVC.hideScrollIndicators = hideScrollIndicators
        return scrollVC
    }

    public  func updateUIViewController(_ viewController: ScrollViewController<Content>, context: Context) {
        viewController.hostingController.rootView = self.content()
    }
}
