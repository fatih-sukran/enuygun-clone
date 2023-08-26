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
                return Image.tabbarSearch
            case .booking:
                return Image.tabbarBooking
            case .checkin:
                return Image.tabbarCheckin
            case .other:
                return Image.tabbarSearch
        }
    }
}

struct TabBar<Content: View>: View {
    let tabbarIndex: Int
    @Binding var selectedTab: Int
    let content: Content
    
    init(tabbarIndex: Int, selectedTab: Binding<Int>, @ViewBuilder content: () -> Content) {
        self.tabbarIndex = tabbarIndex
        self._selectedTab = selectedTab
        self.content = content()
    }
    
    var body: some View {
        content
            .tabItem {
                
            }
            .background(.red)
    }
}

struct TabBarView: View {
    @State private var selectedTab: Int = 0
    
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $selectedTab) {
                HomePageView()
                    .tag(0)
                Booking()
                    .tag(1)
                Checkin()
                    .tag(2)
                ContentView3()
                    .tag(3)
            }
            
            ZStack{
                HStack{
                    EmptyView()
                    ForEach(TabItem.allCases, id: \.self) { item in
                        Button{
                            selectedTab = item.rawValue
                        } label: {
                            CustomTabItem(image: item.icon, title: item.title, isActive: (selectedTab == item.rawValue))
                        }
                    }
                }
                .spacer(.spaceAround)
                .padding(16)
            }
            .frame(height: 60)
            .background(.white)
            .foregroundColor(.green1)
            .cornerRadius(21, corner: .topLeft)
            .cornerRadius(21, corner: .topRight)
            
            .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.12), radius: 16, x: 0, y: 3)
        }
    }
}

extension TabBarView {
    func CustomTabItem(image: Image, title: String, isActive: Bool) -> some View{
        VStack(alignment: .center) {
            image
                .resizable()
                .renderingMode(.template)
                .foregroundColor(isActive ? .green1 : .gray)
                .frame(width: 21, height: 21)
            Text(title)
                .font(.system(size: 11))
                .foregroundColor(isActive ? .green1 : .gray)
                .fontWeight(isActive ? .medium : .light)
        }
        //        .frame(width: isActive ? .infinity : 60, height: 60)
        .foregroundColor(!isActive ? .purple.opacity(0.4) : .clear)
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
