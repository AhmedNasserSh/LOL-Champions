//
//  InfoView.swift
//  ChampionDetails
//
//  Created by Ahmed Naser on 15/01/2022.
//

import SwiftUI

struct InfoView: View {
    let name: String
    let title: String
    let description: String
    
    var body: some View {
        VStack(spacing: 5.0) {
            Text(name)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
            Text(title)
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text(description)
                .font(.body)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
        }.padding(8)
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView(name: "", title: "", description: "")
    }
}
