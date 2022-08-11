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

    var systemIconName: String
    let description: String
    var assignedPage: Page
    let width, height: CGFloat
    let color: Color
    
    let topPadding: CGFloat = 10

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
                .padding(.top, topPadding)
                .foregroundColor(color)
            Text(description)
                .font(.system(size: 11))
                .fontWeight(GetBoldText())
                .foregroundColor(color)
        }
        .onTapGesture {
            viewRouter.currentPage = assignedPage
        }
        .frame(width: UIScreen.main.bounds.size.width / CGFloat(Page.allCases.count + 1)) // +1 by adding another icon to form padding on the sides
    }

}

struct NagivationBarIconView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBarIconView(viewRouter: ViewRouterController(), systemIconName: "plus", description: "something", assignedPage: .YourExamples, width: 30, height: 30, color: .blue)
            .border(.green)
    }
}
