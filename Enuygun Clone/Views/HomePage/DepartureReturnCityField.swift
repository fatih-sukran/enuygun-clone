//
//  HomePageFieldView.swift
//  Enuygun Clone
//
//  Created by Fatih Şükran on 21.08.2023.
//

import SwiftUI

struct departureReturnCityField: View {
    
    @State var departureCity: String
    @State var departureAirport: String
    
    @State var returnCity: String
    @State var returnAirport: String
    
    private let rectangle: some View = RoundedRectangle(cornerRadius: 12)
        .foregroundColor(Color.white)
        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.3), radius: 3, x: 0, y: 1)
    
    var body: some View {
        ZStack{
            HStack{
                VStack {
                    Text(departureCity)
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(.black1)
                        
                        
                    Text(departureAirport)
                        .font(.footnote)
                }
                .frame(width: 168, height: 90)
                .background(rectangle)
                
                VStack {
                    Text(returnCity)
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(.black1)
                    
                    
                    Text(returnAirport)
                        .font(.footnote)
                }
                .frame(width: 168, height: 90)
                .background(rectangle)
            }
            
            
            Button {
                
            } label: {
                Image(systemName: "arrow.right.arrow.left.circle")
                    .font(.system(size: 24))
                    .foregroundColor(.black1)
                    
            }
//            .padding()
            .background(Rectangle().foregroundColor(.white))
        }
    }
}

struct HomePageFieldView_Previews: PreviewProvider {
    static var previews: some View {
        departureReturnCityField(departureCity: "İstanbul", departureAirport: "Sabiha Gökçen", returnCity: "Ankara", returnAirport: "All Airports")
    }
}

struct CustomView: View {
    var body: some View {
        ZStack {
//            RoundedRectangle(cornerRadius: 0)
//                .frame(width: 344, height: 90)
//                .background(
//                    RoundedRectangle(cornerRadius: 0)
//                        .foregroundColor(.clear)
//                        .shadow(color: Color(red: 110, green: 0, blue: 0, opacity: 0.9), radius: 30, x: 0, y: 1)
//                )
            
//            RoundedRectangle(cornerRadius: 0)
//                .frame(width: 344, height: 90)
//                .background(Color.white)
//                .cornerRadius(0)
        }
        .frame(width: 344, height: 90)
        .background(Color.accentColor)
        .padding(EdgeInsets(top: 194, leading: 15, bottom: 0, trailing: 0))
    }
}
