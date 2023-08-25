//
//  SplashView.swift
//  Enuygun Clone
//
//  Created by Fatih Şükran on 18.08.2023.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
            VStack{
                Image("wingie_logo")
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.green1)
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
