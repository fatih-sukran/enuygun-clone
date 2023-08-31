//
//  Color+Extension.swift
//  Enuygun Clone
//
//  Created by Fatih Şükran on 18.08.2023.
//

import Foundation
import SwiftUI

extension Color {
    init(red: Int, green: Int, blue: Int, a: Double = 1.0) {
        self.init(
            red: CGFloat(red) / 255.0,
            green: CGFloat(green) / 255.0,
            blue: CGFloat(blue) / 255.0,
            opacity: a
        )
    }
    
    init(rgb: Int, a: Double = 1.0) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF,
            a: a
        )
    }
    
    init(red: Int, green: Int, blue: Int, a: Int = 0xFF) {
        self.init(
            red: CGFloat(red) / 255.0,
            green: CGFloat(green) / 255.0,
            blue: CGFloat(blue) / 255.0,
            opacity: CGFloat(a) / 255.0
        )
    }
    
    init(argb: Int) {
        self.init(
            red: (argb >> 16) & 0xFF,
            green: (argb >> 8) & 0xFF,
            blue: argb & 0xFF,
            a: (argb >> 24) & 0xFF
        )
    }
}

extension Color {
    static let wingieLogo = "wingie_logo"
    static let backgroundColor = Color("gray")
    
    static let green1 = Color(rgb: 0x2DC44D)
    static let gray1 = Color(rgb: 0xF8FAF9)
    static let black1 = Color(rgb: 0x131717)
    static let black2 = Color(rgb: 0x53605E)
}
