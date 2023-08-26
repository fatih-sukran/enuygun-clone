//
//  View+CornerRadius.swift
//  Enuygun Clone
//
//  Created by Fatih Şükran on 25.08.2023.
//

import SwiftUI

struct RoundedCorner: Shape {
    
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corner: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corner))
    }
}

struct View_CornerRadius_Previews: PreviewProvider {
    static var previews: some View {
        Text("Hello, world!")
            .frame(width: 200, height: 200)
            .background(.green)
            .cornerRadius(21, corner: .topLeft)
            .cornerRadius(21, corner: .bottomRight)
    }
}
