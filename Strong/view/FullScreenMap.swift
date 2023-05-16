//
//  StrongApp.swift
//  Strong
//
//  Created by Bekainar on 13.05.2023.
//

import SwiftUI
import MapKit

struct FullScreenMap: View {
    
    @Environment(\.dismiss) private var dismiss
    @State private var region: MKCoordinateRegion
    
    init(location: CLLocationCoordinate2D, span: MKCoordinateSpan) {
        self._region = State(initialValue: .init(
            center: location,
            span: span
        ))
    }
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Map(coordinateRegion: $region, interactionModes: .all)
            Button {
                dismiss()
            } label: {
                Image(systemName: "xmark.circle.fill")
                    .font(.largeTitle)
                    .symbolRenderingMode(.monochrome)
                    .foregroundColor(.secondary)
            }
            .padding(.top, 40)
            .padding(.trailing)
        }.ignoresSafeArea()
    }
}

struct FullScreenMap_Previews: PreviewProvider {
    static var previews: some View {
        FullScreenMap(
            location: Country.italy.location,
            span: Country.italy.span
        )
    }
}
