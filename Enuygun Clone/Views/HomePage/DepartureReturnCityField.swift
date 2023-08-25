//
//  HomePageFieldView.swift
//  Enuygun Clone
//
//  Created by Fatih Şükran on 21.08.2023.
//

import SwiftUI

private struct Item: View {
    
    @State var city: String
    @State var airport: String
    
    var body: some View {
        VStack {
            Text(city)
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.black1)
            
            Text(airport)
                .font(.footnote)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 90)
        .background(rectangle)
    }
}

struct DepartureReturnCityField: View {
    
    @State var departureCity: String
    @State var departureAirport: String
    
    @State var returnCity: String
    @State var returnAirport: String
    
    var body: some View {
        ZStack{
            HStack{
                Item(city: departureCity, airport: departureAirport)
                Item(city: returnCity, airport: returnAirport)
            }

            Button {
                
            } label: {
                Image(systemName: "arrow.right.arrow.left.circle")
                    .font(.system(size: 24))
                    .foregroundColor(.black1)
                    
            }
            .padding(7)
            .background(Rectangle().foregroundColor(.white))
        }
    }
}

struct HomePageFieldView_Previews: PreviewProvider {
    static var previews: some View {
        DepartureReturnCityField(departureCity: "İstanbul", departureAirport: "Sabiha Gökçen", returnCity: "Ankara", returnAirport: "All Airports")
    }
}

