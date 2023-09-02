//
//  CalenderView.swift
//  Enuygun Clone
//
//  Created by Fatih Şükran on 29.08.2023.
//

import SwiftUI

struct TopBarView: View {
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        HStack {
            Button {
                presentation.wrappedValue.dismiss()
            } label: {
                Image.closeIcon
                    .resizable()
                    .frame(width: 24, height: 24)
            }
            
            Text("Select Departure Date")
                .frame(maxWidth: .infinity)
                .font(.system(size: 17, weight: .semibold))
        }
        .padding([.horizontal], 15)
    }
}

struct CalendarView: View {
    let way: Way
    @Binding var selectedDate: Date

    var body: some View {
        NavigationStack {
            VStack {
                TopBarView()
                ScrollView {
                    ForEach(0..<7, id: \.self) { i in
                        CalenderMonthView(way: way, month: Date.now.firstDayOfMonth().adding(months: i), selectedDate: $selectedDate)
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
    @Binding var selectedDate: Date
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
                    CalenderDayItem(way: way, date: day, selectedDate: $selectedDate)
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
    @Binding var selectedDate: Date
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var flightSearch: FlightSearch
    
    private var isDisable: Bool {
        if way == .return {
            return date.isPast(of: flightSearch.departureDate)
        }
        
        return date.adding(days: 1).isPast()
    }
    
    private var isSelected: Bool {
        date.isEqual(to: selectedDate, components: [.day, .month, .year])
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
                selectedDate = date
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

fileprivate struct CalenderViewTest: View {
    @State var date = Date.now.dateWithoutTime()

    var body: some View {
        CalendarView(way: .return, selectedDate: $date)
    }
}

struct CalenderView_Previews: PreviewProvider {
    static var previews: some View {
        CalenderViewTest()
    }
}
