//
//  TabBarView.swift
//  Enuygun Clone
//
//  Created by Fatih Şükran on 23.08.2023.
//

import SwiftUI

enum TabItem: Int, CaseIterable {
    case search = 0
    case booking = 1
    case checkin = 2
    case other = 3
    
    var title: String {
        switch self {
            case .search:
                return "Search"
            case .booking:
                return "Manage Booking"
            case .checkin:
                return "Check-in"
            case .other:
                return "Other"
        }
    }
    
    var icon: Image {
        switch self {
            case .search:
                return Images.tabbarSearch
            case .booking:
                return Images.tabbarBooking
            case .checkin:
                return Images.tabbarCheckin
            case .other:
                return Images.tabbarOther
        }
    }
}

struct TabBarView: View {
    @State private var selectedTab: Int = 0
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottom) {
                TabView(selection: $selectedTab) {
                    HomePageView()
                        .tag(0)
                    ContentViw()
                        .tag(1)
                    Checkin()
                        .tag(2)
                    Checkin()
                        .tag(3)
                }
                
                ZStack{
                    HStack{
                        ForEach(TabItem.allCases, id: \.self) { item in
                            Button {
                                selectedTab = item.rawValue
                            } label: {
                                CustomTabItem(image: item.icon, title: item.title, isActive: (selectedTab == item.rawValue))
                            }
                            
                            if item.rawValue != TabItem.allCases.last!.rawValue {
                                Spacer()
                            }
                        }
                    }
                    .padding(16)
                }
                .frame(height: 60)
                .frame(maxWidth: .infinity)
                .background(.white)
                //            .foregroundColor(.green1)
                .cornerRadius(21, corner: .topLeft)
                .cornerRadius(21, corner: .topRight)
                
                .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.12), radius: 16, x: 0, y: 3)
            }
            //        .ignoresSafeArea(.all, edges: .bottom)
            .safeAreaInset(edge: .bottom, alignment: .center, spacing: 0) {
                Color.clear
                    .frame(height: 5)
                    .background(.white)
            }
        }
    }
}

extension TabBarView {
    func CustomTabItem(image: Image, title: String, isActive: Bool) -> some View{
        VStack(alignment: .center) {
            image
                .renderingMode(.template)
                .resizable()
                .scaledToFill()
                .frame(width: 21)
                .foregroundColor(isActive ? .green1 : .gray)
                
            Text(title)
                .font(.system(size: 11))
                .foregroundColor(isActive ? .green1 : .gray)
                .fontWeight(isActive ? .medium : .light)
        }
    }
}

struct ContentView2: View {
    @State var selected: Int = 0
    var body: some View {
        TabBarView()
    }
}

struct Booking: View {
    var body: some View {
        Text("Home Page Content")
    }
}

struct Checkin: View {
    var body: some View {
        Text("Search Page Content")
    }
}

struct Other: View {
    var body: some View {
        Text("Settings Page Content")
    }
}


struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView2()
    }
}

