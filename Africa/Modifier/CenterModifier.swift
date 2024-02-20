//
//  CenterModifier.swift
//  Africa
//
//  Created by Eliezer Antonio on 20/02/24.
//

import SwiftUI

struct CenterModifier: ViewModifier {
    func body(content: Content) -> some View {
        HStack {
            Spacer()
            content
            Spacer()
        }
    }
}
