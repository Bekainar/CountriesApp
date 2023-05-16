//
//  CountryListView.swift
//  Strong
//
//  Created by Bekainar on 13.05.2023.
//

import SwiftUI

struct CountryListView: View {
    let countries: [Country]
    
    @State private var searchText: String = ""
    
    var body: some View {
            List {
                ForEach(countries) { country in
                    Text(country.capital)
                    
                }
            }
    }
}

struct CountryListView_Previews: PreviewProvider {
    static var previews: some View {
        CountryListView(countries: CountryFetcher.successState().countries)
    }
}
