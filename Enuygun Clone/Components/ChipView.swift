//
//  ChipView.swift
//  Enuygun Clone
//
//  Created by Fatih Şükran on 3.09.2023.
//

import SwiftUI

struct ChipView: View {
    let text: String
    
    var body: some View {
        Text(text)
            .font(.system(size: 14, weight: .medium))
            .frame(height: 39)
            .padding(.horizontal, 20)
            .border(color: .gray3, width: 1, radius: 8)
        
    }
}

struct TagView_Previews: PreviewProvider {
    static var previews: some View {
        ViewThatFits(in: .vertical) {
            ChipView(text: "İstanbul")
            ChipView(text: "İstanbul")
            ChipView(text: "İstanbul")
            ChipView(text: "İstanbul")
            ChipView(text: "İstanbul")
        }
    }
}

struct ChipContainerView: View {
    @Binding var chips: ChipView
    
    var body: some View {
        var width = CGFloat.zero
        var height = CGFloat.zero
        return GeometryReader { geo in
            ZStack(alignment: .topLeading, content: {
                ForEach(chips) { chip in
                    chip
                    .padding(.all, 5)
                    .alignmentGuide(.leading) { dimension in
                        if (abs(width - dimension.width) > geo.size.width) {
                            width = 0
                            height -= dimension.height
                        }
                        let result = width
                        if chip == chips.last!.id {
                            width = 0
                        } else {
                            width -= dimension.width
                        }
                        return result
                    }
                    .alignmentGuide(.top) { dimension in
                        let result = height
                        if chip == chips.last {
                            height = 0
                        }
                        return result
                    }
                }
            })
        }
    }
}

struct ChipView_Previews: PreviewProvider {
    static var previews: some View {
        ChipView()
    }
}
