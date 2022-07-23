//
//  NavigationBarIconView.swift
//  Chebravo
//
//  Created by Phillip Lundin on 22/07/2022.
//

import Foundation
import SwiftUI

// TODO: Make the clicking of the icons give a little feedback (maybe?)

struct NavigationBarIconView : View {
    @ObservedObject var viewRouter : ViewRouterController

    @State var systemIconName: String

    let description: String
    let assignedPage: Page
    let width, height: CGFloat
    let color: Color

    private func GetIcon() -> String {
        return viewRouter.currentPage == assignedPage ? systemIconName + ".fill" : systemIconName
    }
    
    private func GetBoldText() -> Font.Weight {
        if (viewRouter.currentPage == assignedPage) {
            return .heavy
        } else {
            return .regular
        }
    }

    var body: some View {
        VStack {
            Image(systemName: GetIcon())
                .resizable()
                .scaledToFit()
                .frame(width: width, height: height)
                .padding(.top, 30)
                .foregroundColor(color)
            Text(description)
                .font(.system(size: 11))
                .fontWeight(GetBoldText())
                .foregroundColor(color)
               
        }
        .onTapGesture {
            viewRouter.currentPage = assignedPage
        }
        .frame(width: UIScreen.main.bounds.size.width / CGFloat(Page.allCases.count + 1)) // +1 because of some padding on the sides
    }

}
