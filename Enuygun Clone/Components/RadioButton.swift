////
////  RadioButton.swift
////  Enuygun Clone
////
////  Created by Fatih Şükran on 19.08.2023.
////
//
//import SwiftUI
//
//struct Radio<Content: View>: View {
//    @Binding var selection: Int
//    @ViewBuilder var content: () -> Content
//
//    init(selection: Binding<Int>, @ViewBuilder content: @escaping () -> Content) {
//        self._selection = selection
//        self.content = content
//    }
//
//    var body: some View {
//        VStack(alignment: .leading) {
//            Picker("eaieai", selection: $selection) {
//                content()
//            }
//            .pickerStyle(.navigationLink)
//        }
//    }
//}
//
//struct RadioButton: View, Identifiable {
//    let id = UUID()
//    let text: String
//    var isChecked = true
//
//    var body: some View {
//        HStack {
//            if isChecked {
//                Image.radioButtonChecked
//            } else {
//                Image.radioButtonUnChecked
//            }
//            Text(text)
//        }
//    }
//}
//
//struct RadioButtonView: View {
//
//    var body: some View {
//        Radio(selection: .constant(0)) {
//            RadioButton(text: "B la Bla")
//            RadioButton(text: "Bla Bla")
//            RadioButton(text: "Bla Bla")
//            RadioButton(text: "Bla Bla")
//        }
//    }
//}
//
//

import SwiftUI

struct RadioButton: View {
    let index: Int
    let text: String
    @Binding var selection: Int?
    
    var isSelected: Bool {
        index == selection
    }
    
    var body: some View {
        Button {
            selection = index
        } label: {
            HStack {
                if isSelected {
                    Image.radioButtonChecked
                } else {
                    Image.radioButtonUnChecked
                }
                Text(text)
            }
        }
        .buttonStyle(.plain)
    }
}

struct RadioButtonGroup: View {
    let texts: [String]
    var orientation: Orientation = Orientation.horizonal
    @Binding var selection: Int?
    
    var body: some View {
        if orientation == .horizonal {
            HStack(alignment: .top) {
                radioButtons
            }
        } else {
            VStack(alignment: .leading) {
                radioButtons
            }
        }
    }
    
    @ViewBuilder private var radioButtons: some View {
        ForEach(texts.indices, id: \.self) {index in
            RadioButton(index: index, text: texts[index], selection: $selection)
        }
    }
    
    enum Orientation {
        case horizonal, vertical
    }
}

struct RadioButton_Previews: PreviewProvider {
    @State private var selection: Int?
     var buttons = ["First", "Second", "Third"]
    
    static var previews: some View {
        // Create an instance of RadioButton_Previews to access the @State property.
        RadioButton_Previews().content
    }
    
    var content: some View {
        RadioButtonGroup(texts: buttons, selection: $selection)
    }
}

