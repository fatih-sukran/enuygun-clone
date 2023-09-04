//
//  Image.swift
//  Enuygun Clone
//
//  Created by Fatih Şükran on 18.08.2023.
//

import Foundation
import SwiftUI

struct Images {
    static let radioButtonChecked = Image("radio_button_checked_thin")
    static let radioButtonUnChecked = Image("radio_button_unchecked_thin")
    static let checkBoxEmpty = Image("checkbox_empty")
    static let checkBoxFilled = Image("checkbox_filled")
    static let reverseIcon = Image("reverse_icon")
    static let dateIcon = Image("date_icon")
    static let addIcon = Image("add_icon")
    static let closeIcon = Image("close_icon")
    
    static var filledCloseIcon: some View {
        Image("close_filled_icon")
            .resizable()
            .frame(width: 16, height: 16)
    }
}

extension Images {
    static let tabbarSearch = Image("tabbar_search")
    static let tabbarBooking = Image("tabbar_manage_booking")
    static let tabbarCheckin = Image("tabbar_checkin")
    static let tabbarOther = Image("tabbar_other")
}
