//
//  SplashView.swift
//  Chebravo
//
//  Created by Phillip Lundin on 26/06/2022.
//

import SwiftUI

struct SplashView: View {
    @State var isSplashActive = true
    
    var body: some View {
        ZStack {
            Color("PrimaryColor")
                .ignoresSafeArea()
            
            VStack {
                if (self.isSplashActive) {
                    SplashGraphics()
                } else {
                    ContentView()
                }
            }
            .onAppear() {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.95) {
                    withAnimation {
                        self.isSplashActive = false
                    }
                }
            }
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}


// MARK: COMPONENTS
struct SplashGraphics: View {
    var body: some View {
        HStack {
            // TODO: Add picture with sparkles and the logo afterwards
            Text("CheBravə")
                .font(.system(size: 32))
                .foregroundColor(Color("SecondaryColor"))
                .bold()
        }
    }
}


