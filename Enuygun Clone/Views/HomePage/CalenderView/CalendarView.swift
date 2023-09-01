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
    @Binding var selectedDate: Date
    @Binding var departureDate: Date?

    var body: some View {
        NavigationStack {
            VStack {
                TopBarView()
                ScrollView {
                    ForEach(0..<7, id: \.self) { i in
                        CalenderMonthView(month: Date.now.firstDayOfMonth().adding(months: i), selectedDate: $selectedDate, departureDate: $departureDate)
                    }
                }
                .toolbar(.hidden, for: .navigationBar)
            }
        }
    }
}

struct CalenderMonthView: View {
    let days = ["Mo", "Tu", "We", "Th", "Fr", "Sa", "Su"]
    let month: Date
    let columns = [
        GridItem(.fixed(44), spacing: 0),
        GridItem(.fixed(44), spacing: 0),
        GridItem(.fixed(44), spacing: 0),
        GridItem(.fixed(44), spacing: 0),
        GridItem(.fixed(44), spacing: 0),
        GridItem(.fixed(44), spacing: 0),
        GridItem(.fixed(44), spacing: 0)
    ]
    @Binding var selectedDate: Date
    
    var body: some View {
        VStack {
            Text("\(month.getFullMonthName()) \(month.year.description)")
                .font(.system(size: 16))
                .bold()
            LazyVGrid(columns: columns, spacing: 0) {
                ForEach(days, id: \.self) { day in
                    CalenderDayItem(text: day)
                }
                ForEach(0..<month.firstDayOfMonth().getDayOfWeek(), id: \.self) { i in
                    CalenderDayItem(text: "")
                }
                ForEach(month.getAllMonthDays(), id: \.self) { day in
                    CalenderDayItem(date: day, selectedDate: $selectedDate)
                }
            }
        }
    }
    
    private func isWeekend(index: Int) -> Bool {
        return index % 7 == 6 || index % 7 == 5
    }
}

struct CalenderDayItem: View {
    var date: Date?
    var text: String?
    @Binding var selectedDate: Date
    @Binding var departureDate: Date?
    @Environment(\.presentationMode) var presentationMode
    
    private var isDisable: Bool {
        date?.adding(days: 1).isPast() ?? false || date?.isPast(of: departureDate ?? Date.now) ?? false
    }
    
    private var isSelected: Bool {
        date?.isEqual(to: selectedDate, components: [.day, .month, .year]) ?? false
    }
    
    init(date: Date, selectedDate: Binding<Date>, departureDate: Binding<Date?> = .constant(nil)) {
        self.date = date
        self.text = nil
        self._selectedDate = selectedDate
        self._departureDate = departureDate
    }
    
    init(text: String) {
        self.date = nil
        self.text = text
        self._selectedDate = Binding.constant(Date.distantFuture)
        self._departureDate = .constant(nil)
    }
    
    var body: some View {
        ZStack {
            
            if let text = text {
                Text(text)
                    .font(.system(size: 16, weight: .regular))
                    .frame(width: 44, height: 44)
                    .foregroundColor(.black1)
            } else {
                if date!.isWeekend() {
                    Rectangle().foregroundColor(.gray1)
                }
                
                if isSelected {
                    Circle().foregroundColor(.green1)
                }
                
                Button("\(date!.day)") {
                    if isDisable {
                        return
                    }
                    selectedDate = date!
                    presentationMode.wrappedValue.dismiss()
                }
                .font(.system(size: 16, weight: .regular))
                .foregroundColor(getTextColor())
                .frame(width: 44, height: 44)
            }

        }
    }
    
    func getTextColor() -> Color {
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
        CalendarView(selectedDate: $date)
    }
}

struct CalenderView_Previews: PreviewProvider {
    static var previews: some View {
        CalenderViewTest()
    }
}
