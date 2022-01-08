//
//  CalloutTextView.swift
//  Home
//
//  Created by Ahmed Naser on 08/01/2022.
//

import SwiftUI

public struct CalloutTextView: View {
    public init () {
        
    }
    
    public var body: some View {
        ZStack {
            Text("Ahari")
                .font(.callout)
                .padding(6)
            .foregroundColor(.white)
        }.background(Color.black)
        .opacity(0.8)
        .cornerRadius(10, corners: [.topLeft, .bottomRight])
        .padding(6)
    }
}

struct CalloutTextView_Previews: PreviewProvider {
    static var previews: some View {
        CalloutTextView()
    }
}
