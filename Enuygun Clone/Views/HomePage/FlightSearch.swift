//
//  FlightSearch.swift
//  Enuygun Clone
//
//  Created by Fatih Şükran on 1.09.2023.
//

import Foundation

class FlightSearch: ObservableObject {
    @Published var way:Way?
    @Published var departureCity: String?
    @Published var departureAirport: String?
    @Published var returnCity: String?
    @Published var returnAirport: String?
    @Published var departureDate: Date?
    @Published var returnDate: Date?
}

