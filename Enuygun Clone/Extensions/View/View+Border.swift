//
//  View+Border.swift
//  Enuygun Clone
//
//  Created by Fatih Şükran on 3.09.2023.
//

import SwiftUI

extension View {
    func border(color: Color = .gray, width: Double = 1, radius: Double = 0) -> some View {
        self.overlay {
            RoundedRectangle(cornerRadius: radius)
                .stroke(color, lineWidth: width)
        }
    }
}

struct View_Border: View {
    var body: some View {
        Text("Hello, World!")
            .padding(10)
            .border(color: .indigo, width: 3, radius: 0)
    }
}

struct View_Border_Previews: PreviewProvider {
    static var previews: some View {
        View_Border()
    }
}
