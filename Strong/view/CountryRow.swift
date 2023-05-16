//
//  StrongApp.swift
//  Strong
//
//  Created by Bekainar on 13.05.2023.
//

import SwiftUI

struct CountryRow: View {
    
    let country: Country
    
    var body: some View {
        HStack {
            FlagImage(url: country.flags.png)
                .cornerRadius(8)
                .frame(width: 80, height: 80)
                .padding(.trailing)
            VStack(alignment: .leading, spacing: 8) {
                Text(country.name.common)
                    .font(.headline)
                Text(country.continent.rawValue)
//                Text(country.capital!.name)
            }.frame(maxWidth: .infinity, alignment: .leading)
            Spacer()
        }
    }
}

struct CountryRow_Previews: PreviewProvider {
    static var previews: some View {
        CountryRow(country: .italy)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

