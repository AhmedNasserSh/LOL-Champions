//
//  TagsList.swift
//  ChampionDetails
//
//  Created by Ahmed Naser on 15/01/2022.
//

import SwiftUI

struct TagsList: View {
    let tags: [String]
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack {
                ForEach(tags, id: \.self) { tag in
                    TagsView(text: tag)
                        .padding(.horizontal, 3.0)
                }
            }
        }.padding( [.top], 20)
    }
}

struct TagsList_Previews: PreviewProvider {
    static var previews: some View {
        TagsList(tags: [])
    }
}
