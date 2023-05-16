//
//  StrongApp.swift
//  Strong
//
//  Created by Bekainar on 13.05.2023.
//

import SwiftUI
import MapKit

struct CountryDetails: View {
    
    @EnvironmentObject private var countriesManager: CountriesManager
    
    let country: Country
    
    @State private var mapFullScreenPresented = false
    @State private var region: MKCoordinateRegion
    
    init(country: Country) {
        self.country = country
        self._region = State(
            initialValue: .init(
                center: country.location,
                span: country.span
            )
        )
    }
    
    var body: some View {
        ScrollView{
            VStack{
                flagSection
                DetailView(title: "Region:", text: country.continent.rawValue)
                DetailView(title: "Capital:", text: country.capital!.name)
                DetailView(title: "Population:", text: "\(country.population)")
                DetailView(title: "Area:", text: areaFormatted)
//                DetailView(title: "Timezones", text: [country.timezones])
                currencySection
                timezoneSection
                mapSection
            }
        }
        .navigationTitle(country.name.common)
        .navigationBarTitleDisplayMode(.inline)
        .fullScreenCover(isPresented: $mapFullScreenPresented) {
            FullScreenMap(location: country.location, span: country.span)
        }
    }
}
//MARK: - Components
extension CountryDetails {
    
    private var flagSection: some View {
        FlagImage(url: country.flags.png)
            .cornerRadius(8)
            .padding()
    }
    @ViewBuilder
    private var currencySection: some View {
        HStack(spacing: 8){
            Text("•")
                .font(.system(size: 40))
            VStack(alignment: .leading, spacing: 4){
                Text("Currency:")
                    .font(.system(size: 15))
                    .foregroundColor(Color(red: 136/255, green: 136/255, blue: 136/255))
                if !country.currencies.isEmpty {
                    Section {
                        ForEach(country.currencies, id: \.name) { currency in
                            HStack {
                                Text(currency.name)
                                Text("(\(currency.symbol))")
                                Text("(\(currency.ISO4217 ?? ""))")
                                
                            }
                        }
                    }
                }
            }
            Spacer()
        } .padding()
    }
    private var mapSection: some View {
        Section {
            Map(coordinateRegion: $region, interactionModes: .zoom)
                .frame(minHeight: 300)
                .cornerRadius(15)
                .padding()
                .onTapGesture {
                    mapFullScreenPresented.toggle()
                }
        }
    }
    
    @ViewBuilder
    private var timezoneSection: some View {
        HStack(spacing: 8){
            Text("•")
                .font(.system(size: 40))
            VStack{
                Text("Timezones:")
                    .font(.system(size: 15))
                    .foregroundColor(Color(red: 136/255, green: 136/255, blue: 136/255))
                if let timezones = country.timezones {
                    Section {
                        ForEach(timezones, id:\.self) { timezone in
                            Text(timezone)
                                .font(.title3)
                        }
                    }
                }
            }
            Spacer()
        } .padding()
    }
}

struct DetailView : View {
    
    var title: String
    var text : String
    
    var body: some View {
        HStack(spacing: 8){
            Text("•")
                .font(.system(size: 40))
            VStack(alignment: .leading, spacing: 4){
                Text(title)
                    .font(.system(size: 15))
                    .foregroundColor(Color(red: 136/255, green: 136/255, blue: 136/255))
                Text(text)
                    .font(.system(size: 20, weight: .regular))
            }
            Spacer()
        } .padding()
    }
    
}

extension CountryDetails {
    private var areaFormatted: String {
        let measure = Measurement<UnitArea>(value: country.area, unit: .squareKilometers)
        return measure.formatted()
    }
}

struct CountryDetails_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            CountryDetails(country: .italy)
                .environmentObject(
                    CountriesManager(networkingService: NetworkingService())
                )
        }
    }
}
