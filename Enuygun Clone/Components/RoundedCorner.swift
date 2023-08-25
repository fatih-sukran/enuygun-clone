//
//  RoundedCorner.swift
//  Enuygun Clone
//
//  Created by Fatih Şükran on 18.08.2023.
//

import Foundation
import SwiftUI

struct RoundedCorners<Content>: View where Content: View{
    private var content: () ->  (Content)
    
    init(@ViewBuilder content: @escaping () -> (Content)) {
        self.content = content
    }
    
    var body: some View {
        content()
            .frame(maxWidth: .infinity)
            .frame(maxHeight: .infinity)
//            .padding(14)
            .background(RoundedCornerShape()
                .foregroundColor(Color.backgroundColor))
    }
}

extension RoundedCorners {
    
}

// Custom shape to create rounded corners on specific corners
private struct RoundedCornerShape: Shape {
    var radius: CGFloat = 30
    var corners: UIRectCorner = [.topLeft, .topRight]
    var backgroundColor: Color = Color.backgroundColor
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}
