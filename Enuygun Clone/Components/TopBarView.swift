//
//  TopBar.swift
//  Enuygun Clone
//
//  Created by Fatih Şükran on 1.09.2023.
//

import SwiftUI

struct TopBarView: View {
    let title: String
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
            
            Text(title)
                .frame(maxWidth: .infinity)
                .font(.system(size: 17, weight: .semibold))
        }
        .padding([.horizontal], 15)
    }
}

struct TopBarView_Previews: PreviewProvider {
    static var previews: some View {
        TopBarView(title: "Select Departure Date")
    }
}
