//
//  ErrorView.swift
//  Strong
//
//  Created by Bekainar on 13.05.2023.
//

import SwiftUI

struct ErrorView: View {
    @ObservedObject var countryFetcher: CountryFetcher
    var body: some View {
        VStack {
            
            Text("🌏")
                .font(.system(size: 80))
            
            Text(countryFetcher.errorMessage ?? "")
            
            Button {
                countryFetcher.fetchAllCountries()
            } label: {
                Text("Try again")
            }

          
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(countryFetcher: CountryFetcher())
    }
}
