//
//  NavigationBarView.swift
//  Chebravo
//
//  Created by Phillip Lundin on 22/07/2022.
//

import SwiftUI

struct NavigationBarView: View {
    @StateObject var ViewRouter : ViewRouterController
    let iconWidth : CGFloat = 30
    let iconHeight : CGFloat = 30
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Color("PrimaryColor")
                    .ignoresSafeArea()
                
                VStack {
                    switch ViewRouter.currentPage {
                    case .YourWords:
                        AllWords()
                    case .Learn:
                        LearnView()
                    case .YourExamples:
                        YourExamplesView()
                    case .Settings:
                        SettingsView()
                    }
                
                    HStack {
                        NavigationBarIconView( // Learning
                            viewRouter: ViewRouter,
                            systemIconName: "graduationcap",
                            assignedPage: .Learn,
                            width: iconWidth,
                            height: iconHeight,
                            color: .black
                        )
                        
                        NavigationBarIconView( // All words
                            viewRouter: ViewRouter,
                            systemIconName: "pencil.circle",
                            assignedPage: .YourWords,
                            width: iconWidth,
                            height: iconHeight,
                            color: .black
                        )
                        
                        NavigationBarIconView( // Examples
                            viewRouter: ViewRouter,
                            systemIconName: "quote.bubble",
                            assignedPage: .YourExamples,
                            width: iconWidth,
                            height: iconHeight,
                            color: .black
                        )
                        
                        NavigationBarIconView( // settings page
                            viewRouter: ViewRouter,
                            systemIconName: "gearshape",
                            assignedPage: .Settings,
                            width: iconWidth,
                            height: iconHeight,
                            color: .black
                        )
                    }
                    .frame(width: geo.size.width, height: geo.size.height/15)
                }
                .background(Color("SecondaryColor"))
                
            }
            
        }
    }
}

struct NagivationBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBarView(ViewRouter: ViewRouterController())
    }
}
