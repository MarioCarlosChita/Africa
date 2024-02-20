//
//  HeadingView.swift
//  Africa
//
//  Created by Eliezer Antonio on 14/01/24.
//

import SwiftUI

struct HeadingView: View {
    var headingImage: String
    var headingText: String

    var body: some View {
        HStack {
            Image(systemName: headingImage)
                .foregroundColor(.accentColor)
                .imageScale(.large)

            Text(headingText)
                .font(.title3)
                .fontWeight(.bold)

        }.padding(.vertical)
    }
}

#Preview {
    HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Wilderness in Pictures")
        .previewLayout(.sizeThatFits)
        .padding()
}
