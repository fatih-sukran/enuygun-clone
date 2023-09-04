//
//  Enuygun_CloneApp.swift
//  Enuygun Clone
//
//  Created by Fatih Şükran on 18.08.2023.
//

import SwiftUI

@main
struct Enuygun_CloneApp: App {
    var flightSearch = FlightSearch()
    var body: some Scene {
        WindowGroup {
            TabBarView()
                .environmentObject(flightSearch)
        }
    }
}

struct Enuygun_CloneApp_Previews: PreviewProvider {
    static var previews: some View {
        TabView {
            Group {
                ContentViw()
                    .tabItem {
                        Label("Men5u", systemImage: "list.dash")
                    }
                
                HomePageView()
                    .tabItem {
                        Label("Menu", systemImage: "list.dash")
                    }
                HomePageView()
                    .tabItem {
                        Label("Menu", systemImage: "list.dash")
                    }
                ContentViw()
                    .tabItem {
                        Label("Menu", systemImage: "list.dash")
                    }
            }
//            .tabViewStyle(TabViewStyle)
            .toolbarBackground(.indigo, for: .tabBar)
            .toolbarBackground(.visible, for: .tabBar)
        }
//        .cornerRadius(21)
        
//        .background(.blue)
//        .background(.blue)
    }
}

struct TabBarButton: View {
    let imageName: String
    let title: String
    let tabIndex: Int
    @Binding var selectedTab: Int
    
    var body: some View {
        Button(action: {
            selectedTab = tabIndex
        }) {
            VStack(spacing: 4) {
                Image(systemName: imageName)
                Text(title)
                    .font(.caption)
            }
            .padding(.vertical, 8)
            .foregroundColor(selectedTab == tabIndex ? .blue : .gray)
        }
    }
}

