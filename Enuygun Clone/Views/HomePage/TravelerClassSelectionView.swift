//
//  TravelerClassSelectionView.swift
//  Enuygun Clone
//
//  Created by Fatih Şükran on 22.08.2023.
//

import SwiftUI

struct TravelerClassSelectionView: View {
    @State var travellerCount: Int
    
    var body: some View {
        HStack {
            Text("**\(travellerCount) Traveler** / Economy")
                .font(.system(size: 16))
                .foregroundColor(.black2)
            
            Spacer()
            HStack {
                Image.addIcon
                    .resizable()
                    .frame(width: 24, height: 24)
                Text("Add Travelers")
                    .font(.system(size: 16))
                    .foregroundColor(.black2)
            }
        }
        .padding(20)
        .background(rectangle)
    }
}

struct TravelerClassSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        TravelerClassSelectionView(travellerCount: 1)
    }
}
