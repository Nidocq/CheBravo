//
//  NavigationBarView.swift
//  Chebravo
//
//  Created by Phillip Lundin on 22/07/2022.
//

import SwiftUI


// TODO: Make transitions smooth (Sliding into one another) look at Blue NFC App for inspiration
// TODO: Make the navigationView work on IPhone 8 as well (Right now it is cropped)

/// <summary> Main view for the navigationBar (TabView for apple). Displays the view
/// based on the the ViewRouters current page. </summary>
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
                        ExampleView()
                    case .Settings:
                        SettingsView()
                    }
                
                    HStack(alignment: .center) {
                        Spacer()
                        NavigationBarIconView( // Learning
                            viewRouter: ViewRouter,
                            systemIconName: "graduationcap",
                            description: "Learning",
                            assignedPage: .Learn,
                            width: iconWidth,
                            height: iconHeight,
                            color: Color("SecondaryColor")
                        )
                        Spacer()
                        NavigationBarIconView( // All words
                            viewRouter: ViewRouter,
                            systemIconName: "pencil.circle",
                            description: "Words",
                            assignedPage: .YourWords,
                            width: iconWidth,
                            height: iconHeight,
                            color: Color("SecondaryColor")
                        )
                        Spacer()
                        
                        NavigationBarIconView( // Examples
                            viewRouter: ViewRouter,
                            systemIconName: "quote.bubble",
                            description: "Examples",
                            assignedPage: .YourExamples,
                            width: iconWidth,
                            height: iconHeight,
                            color: Color("SecondaryColor")
                        )
                        Spacer()
                        NavigationBarIconView( // settings page
                            viewRouter: ViewRouter,
                            systemIconName: "gearshape",
                            description: "Settings",
                            assignedPage: .Settings,
                            width: iconWidth,
                            height: iconHeight,
                            color: Color("SecondaryColor")
                        )
                        Spacer()
                    }
                    .frame(width: geo.size.width, height: geo.size.height/14)
                }
                .background(Color("PrimaryColor"))
                
            }
            
        }
    }
}

struct NagivationBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBarView(ViewRouter: ViewRouterController())
    }
}
