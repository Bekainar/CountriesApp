//
//  StrongApp.swift
//  Strong
//
//  Created by Bekainar on 13.05.2023.
//

import SwiftUI

struct FlagImage: View {
    
    let url: URL
    
    var body: some View {
        AsyncImage(url: url) { phase in
            if let image = phase.image {
                image
                    .resizable()
                    .scaledToFit()
            } else if phase.error != nil {
                Color.secondary
            } else {
                ProgressView()
            }
        }
    }
}

struct CountryFlagImage_Previews: PreviewProvider {
    static var previews: some View {
        FlagImage(url: Country.italy.flags.png)
    }
}

