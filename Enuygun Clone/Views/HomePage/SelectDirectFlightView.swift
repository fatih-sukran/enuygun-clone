//
//  SelectDirectFlightView.swift
//  Enuygun Clone
//
//  Created by Fatih Şükran on 22.08.2023.
//

import SwiftUI

struct SelectDirectFlightView: View {
    
    @State var isOn: Bool
    
    var body: some View {
        HStack {
            Toggle(isOn: $isOn) {
                Text("Show non-stop flights only")
                    .foregroundColor(.black1)
                    .font(.system(size: 16))
            }
            .toggleStyle(CheckboxStyle())
        }
    }
}

struct SelectDirectFlightView_Previews: PreviewProvider {
    @State static var isOn = true
    
    static var previews: some View {
        SelectDirectFlightView(isOn: isOn)
    }
}
