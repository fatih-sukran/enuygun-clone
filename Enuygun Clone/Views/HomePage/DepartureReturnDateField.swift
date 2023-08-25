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

private struct Item: View {
    var body: some View {
        Text("Hello")
    }
}

private struct Item_Previews: PreviewProvider {
    static var previews: some View {
        Item()
    }
}


fileprivate struct DateItem: View {
    var text: String
    @State var date: Date
    
    var body: some View {
        VStack {
            Text(text)
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

struct DepartureReturnDateField: View {
    
    @State var departureDate: Date
    @State var returnDate: Date
    
    var body: some View {
        ZStack{
            HStack{
                DateItem(text: "Depart on", date: departureDate)
                DateItem(text: "Return on", date: returnDate)
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
        DepartureReturnDateField(departureDate: Date.now, returnDate: Date.now.adding(days: 25))
    }
}

