//
//  HomeItemOverlay.swift
//  Home
//
//  Created by Ahmed Naser on 09/01/2022.
//

import SwiftUI

public struct TextOverlay: View {
    let text: String
    public init(text: String) {
        self.text = text
    }
    
    public var body: some View {
        Text(text)
            .font(.body)
            .frame(maxWidth: .infinity)
            .foregroundColor(.white)
            .padding()
            .background(Color.black)
            .opacity(0.7)
            .cornerRadius(20, corners: [.bottomLeft, .bottomRight])
    }
}

struct HomeListRowOverlay_Previews: PreviewProvider {
    static var previews: some View {
        TextOverlay(text: "Ahari")
    }
}
