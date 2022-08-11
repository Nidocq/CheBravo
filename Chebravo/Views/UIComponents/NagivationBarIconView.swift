//
//  NavigationBarIconView.swift
//  Chebravo
//
//  Created by Phillip Lundin on 22/07/2022.
//

import Foundation
import SwiftUI

// TODO: Make the clicking of the icons give a little feedback (maybe?)
// TODO: Make it easier to click on the icons

/// <summary> Icons made for the NavigationBarView. Made to be easily extendable
/// with minimal magic numbers and dynamic sizes. </summary>
/// <param name="systemIconName"> Name of the system for Image(systemName: xx) </param>
/// <param name="description"> text shown underneath the icon </param>
/// <param name="assignedPage"> enum value of the current page that is being displayed </param>
/// <param name="width, height"> size of the component, usually needs to be same height and width </param>
/// <param name="color"> color of the component </param>
struct NavigationBarIconView : View {
    @ObservedObject var viewRouter : ViewRouterController

    var systemIconName: String
    let description: String
    var assignedPage: Page
    let width, height: CGFloat
    let color: Color
    
    let topPadding: CGFloat = 10

    private func UpdateIcon() -> String {
        return viewRouter.currentPage == assignedPage ? systemIconName + ".fill" : systemIconName
    }
    
    private func UpdateBoldText() -> Font.Weight {
        if (viewRouter.currentPage == assignedPage) {
            return .heavy
        } else {
            return .regular
        }
    }

    var body: some View {
        VStack {
            Image(systemName: UpdateIcon())
                .resizable()
                .scaledToFit()
                .frame(width: width, height: height)
                .padding(.top, topPadding)
                .foregroundColor(color)
            Text(description)
                .font(.system(size: 11))
                .fontWeight(UpdateBoldText())
                .foregroundColor(color)
        }
        .frame(width: UIScreen.main.bounds.size.width / CGFloat(Page.allCases.count + 1)) // +1 by adding another icon to form padding on the sides
        .onTapGesture {
            viewRouter.currentPage = assignedPage
        }
    }

}

struct NagivationBarIconView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBarIconView(viewRouter: ViewRouterController(), systemIconName: "plus", description: "something", assignedPage: .YourExamples, width: 30, height: 30, color: .blue)
            .border(.green)
    }
}
