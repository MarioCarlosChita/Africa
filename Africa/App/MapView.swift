//
//  MapView.swift
//  Africa
//
//  Created by Eliezer Antonio on 14/01/24.
//

import MapKit
import SwiftUI
struct MapView: View {
    @State private var region: MKCoordinateRegion = {
        var mapCoordinates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
        var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        var mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)

        return mapRegion
    }()

    let locations: [NationalParkLocation] = Bundle.main.decode("locations.json")

    var body: some View {
        // MARK: - N1 BASIC MAP

        // Map(coordinateRegion: $region)

        // MARK: N2 ADVANCED MAP

        Map(coordinateRegion: $region, annotationItems: locations, annotationContent: { item in
            // (A) PIN: OLD Style (always static)
            //  MapPin(coordinate: item.location, tint: .accentColor)

            // (B) New Style (always static)
            //   MapMarker(coordinate: item.location, tint: .accentColor)

            // (C) Custom basic anotation (it could inteactive)

//            MapAnnotation(coordinate: item.location) {
//                Image("logo")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 32, height: 32, alignment: .center)
//            } //: ANNOTATION

            // (D) CUSTOM ADVANCED (IT COULD BE INREACTIVE)
            MapAnnotation(coordinate: item.location) {
                MapAnnotationView(location: item)
            }
        }) //: MAP
        .overlay(
            HStack(alignment: /*@START_MENU_TOKEN@*/ .center/*@END_MENU_TOKEN@*/, spacing: 12) {
                Image("compass")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48, height: 48, alignment: .center)
                
                VStack(alignment: .leading, spacing: 3) { 
                    
                    HStack {
                        Text("Latitude")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        Spacer()
                        Text("\(region.center.latitude)").foregroundColor(.white)
                    } //: HSTACK

                    Divider()

                    HStack {
                        Text("Longitude")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        Spacer()
                        Text("\(region.center.longitude)").foregroundColor(.white)
                    } //: HSTACK
                    
                } //: VSTACK
                
            } //: STACK
            .padding(.vertical, 12)
            .padding(.horizontal, 16)
            .background(Color.black
                .cornerRadius(8)
                .opacity(0.6)
            ).padding(), alignment: .top
        )
    }
}

#Preview {
    MapView()
}
