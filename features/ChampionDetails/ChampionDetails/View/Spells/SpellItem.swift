//
//  SpellItem.swift
//  ChampionDetails
//
//  Created by Ahmed Naser on 15/01/2022.
//

import SwiftUI

struct SpellItem: View {
    let image: UIImage
    let spellName: String
    let spellDesc: String
    
    var body: some View {
        HStack(spacing: 5.0) {
            Image(imageName: "AatroxW")
                .resizable()
                .frame(width: 50, height: 50)
            VStack(spacing: 5.0) {
                Text(spellName)
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity,
                           alignment: .leading)
                Text(spellDesc)
                    .foregroundColor(.white)
                    .font(.subheadline)
                    .frame(maxWidth: .infinity,
                           alignment: .leading)
            }
            
        }
        .padding(5)
        .background(Color.black)
        .opacity(0.7)
        .cornerRadius(5)

    }
    
}

struct SpellItem_Previews: PreviewProvider {
    static var previews: some View {
        SpellItem(image: UIImage(),
                  spellName: "Hello",
                  spellDesc: "Bye")
    }
}
