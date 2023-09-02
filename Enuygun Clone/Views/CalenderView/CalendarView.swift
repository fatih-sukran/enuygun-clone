//
//  CalenderView.swift
//  Enuygun Clone
//
//  Created by Fatih Şükran on 29.08.2023.
//

import SwiftUI

struct CalendarView: View {
    let way: Way

    var body: some View {
        NavigationStack {
            VStack {
                TopBarView(title: "Select \(way == .departure ? "Departure" : "Return") Date")
                ScrollView {
                    ForEach(0..<7, id: \.self) { i in
                        CalenderMonthView(way: way, month: Date.now.firstDayOfMonth().adding(months: i))
                    }
                }
                .toolbar(.hidden, for: .navigationBar)
            }
        }
    }
}

struct CalenderMonthView: View {
    let way: Way
    let month: Date

    private let days = ["Mo", "Tu", "We", "Th", "Fr", "Sa", "Su"]
    private let columns = [
        GridItem(.fixed(44), spacing: 0),
        GridItem(.fixed(44), spacing: 0),
        GridItem(.fixed(44), spacing: 0),
        GridItem(.fixed(44), spacing: 0),
        GridItem(.fixed(44), spacing: 0),
        GridItem(.fixed(44), spacing: 0),
        GridItem(.fixed(44), spacing: 0)
    ]
    
    var body: some View {
        VStack {
            Text("\(month.getFullMonthName()) \(month.year.description)")
                .font(.system(size: 16))
                .bold()
            LazyVGrid(columns: columns, spacing: 0) {
                ForEach(days, id: \.self) { day in
                    MonthDayTextCell(day: day)
                }
                ForEach(0..<month.firstDayOfMonth().getDayOfWeek(), id: \.self) { i in
                    EmptyCalendarDayCell()
                }
                ForEach(month.getAllMonthDays(), id: \.self) { day in
                    CalenderDayItem(way: way, date: day)
                }
            }
        }
    }
}

struct MonthDayTextCell: View {
    var day: String
    
    var body: some View {
        Text(day)
            .font(.system(size: 16, weight: .regular))
            .frame(width: 44, height: 44)
            .foregroundColor(.black1)
    }
}

struct EmptyCalendarDayCell: View {
    
    var body: some View {
        Rectangle()
            .frame(width: 44, height: 44)
            .foregroundColor(.white)
    }
}

struct CalenderDayItem: View {
    let way: Way
    let date: Date
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var flightSearch: FlightSearch
    
    private var isDisable: Bool {
        if way == .return {
            return date.isPast(of: flightSearch.departureDate)
        }
        
        return date.adding(days: 1).isPast()
    }
    
    private var isSelected: Bool {
        let selectedDate = way == .departure ? flightSearch.departureDate : flightSearch.returnDate
        return date.isEqual(to: selectedDate, components: [.day, .month, .year])
    }
    
    var body: some View {
        ZStack {
            if date.isWeekend() {
                Rectangle().foregroundColor(.gray1)
            }
            
            if isSelected {
                Circle().foregroundColor(.green1)
            }
            
            Button("\(date.day)") {
                if isDisable {
                    return
                }
                if way == .departure && flightSearch.returnDate.isPast(of: date) {
                    flightSearch.returnDate = date
                }
                
                if (way == .departure) {
                    flightSearch.departureDate = date
                } else {
                    flightSearch.returnDate = date
                }
                
                presentationMode.wrappedValue.dismiss()
            }
            .font(.system(size: 16, weight: .regular))
            .foregroundColor(getTextColor())
            .frame(width: 44, height: 44)
        }
    }
    
    private func getTextColor() -> Color {
        if isSelected {
            return .white
        }
        
        if isDisable {
            return .gray2
        }
        
        return .black1
    }
}

struct CalenderView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView(way: .departure)
            .environmentObject(FlightSearch())
    }
}
