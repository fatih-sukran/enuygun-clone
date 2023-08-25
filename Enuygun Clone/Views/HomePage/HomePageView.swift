//
//  HomePage.swift
//  Enuygun Clone
//
//  Created by Fatih Şükran on 18.08.2023.
//

import SwiftUI

struct HomePageView: View {
    var cases = ["One Way", "Round Trip"]
    @State var selection: Int? = 0
    @State var isDirect: Bool = false
    
    var body: some View {
        VStack {
            Image("wingie_logo")
                .padding(21)
            RoundedCorners {
                VStack {
                    RadioButtonGroup(texts: cases, selection: $selection)
                        .padding(.top, 10)
                    DepartureReturnCityField(departureCity: "İstanbul",
                                             departureAirport: "Sabiha Gökçen",
                                             returnCity: "Ankara",
                                             returnAirport: "All Airports")
                        .padding(.top, 20)
                    DepartureReturnDateField(departureDate: Date.now,
                                             returnDate: Date.now.adding(days: 25))
                        .padding(.top, 10)
                    
                    TravelerClassSelectionView(travellerCount: 1)
                        .padding(.top, 10)
                    SelectDirectFlightView(isOn: isDirect)
                        .padding(.top, 10)
                    
                    FindBestDealButton()
                        .padding(.top, 20)
                    Spacer()
                }
                .padding(15)
//                Spacer()
            }
        }
        .frame(maxWidth: .infinity)
        .frame(maxHeight: .infinity)
        .background(Color.green1)
//        .edgesIgnoringSafeArea(.all)
    }
}

enum Way {
    case oneWay
    case roundTrip
}

struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
    }
}


//Radio {
//    RadioButton
//}
