//
//  CheckBoxView.swift
//  Enuygun Clone
//
//  Created by Fatih Şükran on 22.08.2023.
//

import SwiftUI

struct CheckboxStyle: ToggleStyle {
    
    func makeBody(configuration: Self.Configuration) -> some View {
        
        return HStack(alignment: .center, spacing: .zero) {
            if configuration.isOn {
                Images.checkBoxFilled
                    .resizable()
                    .frame(width: 24, height: 24)
            } else {
                Images.checkBoxEmpty
                    .resizable()
                    .frame(width: 24, height: 24)
            }
            
            configuration.label
                .padding(.leading, 5)
            Spacer()
        }
        
    }
}
