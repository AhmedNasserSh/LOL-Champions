//
//  TagsView.swift
//  ChampionDetails
//
//  Created by Ahmed Naser on 15/01/2022.
//

import SwiftUI

struct TagsView: View {
    let text: String
    
    var body: some View {
        Text(text)
            .font(.body)
            .frame(maxWidth: .infinity, maxHeight: 10)
            .foregroundColor(.white)
            .padding()
            .background(Color.black)
            .opacity(0.7)
            .cornerRadius(10)
        
    }
}

struct TagsView_Previews: PreviewProvider {
    static var previews: some View {
        TagsView(text: "Tank")
    }
}
