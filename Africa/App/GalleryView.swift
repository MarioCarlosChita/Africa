//
//  GalleryView.swift
//  Africa
//
//  Created by Eliezer Antonio on 14/01/24.
//

import SwiftUI

struct GalleryView: View {
    // MARK: PROPERTIES

    @State private var selectedAnimal: String = "lion"

    let animals: [Animal] = Bundle.main.decode("animals.json")
    let haptics: UIImpactFeedbackGenerator = UIImpactFeedbackGenerator(style: .medium)

    // Simple grid definition

    // let gridLayout: [GridItem] = [
    //    GridItem(.flexible()),
    //    GridItem(.flexible()),
    //    GridItem(.flexible()),
    // ]

    // EFFICINT GRID DEFINITION

    //  let gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 3)

    // DYNAMIC GRID LATOUT

    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn: Double = 3.0

    func gridSwitch() {
        gridLayout = Array(repeating: .init(.flexible()), count: Int(gridColumn))
    }

    //: MARK: body
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            // MARK: - GRID

            VStack(alignment: .center, spacing: 30) {
                // MARK: - Image

                Image(selectedAnimal)
                    .resizable()
                    .scaledToFit()
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .overlay(Circle().stroke(Color.white, lineWidth: 8))

                // MARK: SLIDER

                Slider(value: $gridColumn, in: 2 ... 4, step: 1)
                    .padding(.horizontal)
                    .onChange(of: gridColumn, perform: { _ in
                        gridSwitch()
                    })

                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                    ForEach(animals) { item in
                        Image(item.image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 1))
                            .onTapGesture {
                                selectedAnimal = item.image
                                haptics.impactOccurred()
                            }
                    } //: LOOP
                } //: GRID
                .animation(.easeIn)
                .onAppear(perform: {
                    gridSwitch()
                })
            } //: VSTACK
            .padding(.horizontal, 10)
            .padding(.vertical, 50)
        } //: SCROLL
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(MotionAnimationView())
    }
}

#Preview {
    GalleryView()
}
