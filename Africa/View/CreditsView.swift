//
//  CreditsView.swift
//  Africa
//
//  Created by Eliezer Antonio on 20/02/24.
//

import SwiftUI

struct CreditsView: View {
    var body: some View {
        VStack {
            Image("compass")
                .resizable()
                .scaledToFit()
                .frame(width: 128, height: 128)

            Text("""
             Copyright @ Eliezer Antonio
            All right reserved
            Better Apps Less Code
            """).font(.footnote)
                .multilineTextAlignment(.center)
        } //: VSTACK
        .padding()
        .opacity(0.4)
    }
}

#Preview {
    CreditsView().padding()
}
