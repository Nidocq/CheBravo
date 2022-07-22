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
                        YourExamples()
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
                            systemIconName: "book",
                            assignedPage: .YourWords,
                            width: iconWidth,
                            height: iconHeight,
                            color: .black
                        )
                        
                        NavigationBarIconView( // Examples
                            viewRouter: ViewRouter,
                            systemIconName: "ear",
                            assignedPage: .YourExamples,
                            width: iconWidth,
                            height: iconHeight,
                            color: .black
                        )
                    }
                    .frame(width: geo.size.width, height: geo.size.height/11)
                }
                .background(Color.white)
            }
            
        }
    }
}

struct NagivationBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBarView(ViewRouter: ViewRouterController())
    }
}
