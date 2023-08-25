//
//  FlatButton.swift
//  Enuygun Clone
//
//  Created by Fatih Şükran on 22.08.2023.
//

import SwiftUI

struct FindBestDealButton: View {
    
    var body: some View {
        Button(action: {
        
        }, label: {
            Text("Find Best Deal")
                .font(.system(size: 18))
                .bold()
            Image(systemName: "arrow.forward")
                .font(.system(size: 18))
                .bold()
        })
        .frame(maxWidth: .infinity)
        .padding(14)
        .foregroundColor(.white)
        .background(RoundedRectangle(cornerRadius: 25)
            .foregroundColor(.green))

    }
}

struct FlatButton_Previews: PreviewProvider {
    static var previews: some View {
        FindBestDealButton()
    }
}
