//
//  PopularOptionsView.swift
//  Enuygun Clone
//
//  Created by Fatih Şükran on 3.09.2023.
//

import SwiftUI

struct PopularOptionsView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Popular Options")
                    .font(.system(size: 11, weight: .semibold))
                    .foregroundColor(.black1)
                Spacer()
            }
            ChipView(text: "Istanbul")
        }
    }
}

struct PopularOptionsView_Previews: PreviewProvider {
    static var previews: some View {
        PopularOptionsView()
    }
}
