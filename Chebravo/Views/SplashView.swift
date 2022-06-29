//
//  SplashView.swift
//  Chebravo
//
//  Created by Phillip Lundin on 26/06/2022.
//

import SwiftUI
// TODO: Make the title of CheBravo slide into the navigationtitle in the Contentview (AllWords view)
struct SplashView: View {
    @State var isSplashActive = true
    @StateObject private var CDController = CoreDataController()
    
    var body: some View {
        ZStack {
            Color("PrimaryColor")
                .ignoresSafeArea()
            
            VStack {
                if (self.isSplashActive) {
                    SplashGraphics()
                } else {
                    ContentView()
                        .environment(\.managedObjectContext, CDController.modelContainer.viewContext)
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
            // CheBravə
            Text("CheBravo")
                .font(.system(size: 32))
                .foregroundColor(Color("SecondaryColor"))
                .bold()
        }
    }
}


