//
//  HomePageFieldView.swift
//  Enuygun Clone
//
//  Created by Fatih Şükran on 21.08.2023.
//

import SwiftUI

let rectangle: some View = RoundedRectangle(cornerRadius: 12)
    .foregroundColor(Color.white)
    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.1), radius: 3, x: 0, y: 1)

fileprivate struct DateItem: View {
    let way: Way
    @Binding var date: Date
    
    var body: some View {
        NavigationLink {
            CalendarView(way: way, selectedDate: $date)
        } label: {
            VStack {
                Text(way == .departure ? "Depart on" : "Return on")
                    .font(.system(size: 14))
                    .foregroundColor(.black1)
                
                HStack(alignment: .center) {
                    Text("\(date.get(.day))")
                        .font(.system(size: 32))
                        .fontWeight(.bold)
                        .foregroundColor(.black1)
                    
                    VStack(alignment: .leading) {
                        Text(date.getFullMonthName())
                            .font(.system(size: 11))
                            .foregroundColor(.black1)
                        Text(date.getFullDayName())
                            .font(.system(size: 11))
                            .foregroundColor(.black1)
                    }
                }
            }
            .frame(maxWidth: .infinity)
            .frame(height: 90)
            .background(rectangle)
        }
    }
}

fileprivate struct AddReturnDateView: View {
    
    @EnvironmentObject var flightSearch: FlightSearch
    
    var body: some View {
        NavigationLink {
            CalendarView(way: .return)
        } label: {
            HStack(alignment: .center, spacing: 0) {
                Image.addIcon
                    .resizable()
                    .frame(width: 10, height: 10)
                    .padding(14)
                
                Text("Add Return")
                    .font(.system(size: 16, weight: .regular))
            }
        }

       
    }
}

struct DepartureReturnDateField: View {
    
    @EnvironmentObject var flightSearch: FlightSearch
    
    var body: some View {
        ZStack{
            HStack{
                DateItem(way: .departure, date: $flightSearch.departureDate)
                DateItem(way: .return, date: $flightSearch.returnDate)
            }
            
            Button {
                
            } label: {
                Image.dateIcon
                    .resizable()
                    .frame(width: 24, height: 22.5)
            }
            .padding(7)
            .background(Rectangle().foregroundColor(.white))
        }
    }
}

struct DepartureReturnDateField_Previews: PreviewProvider {
    static var previews: some View {
        DepartureReturnDateField()
            .environmentObject(FlightSearch())
    }
}

