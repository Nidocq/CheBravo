//
//  NavigationBarIconView.swift
//  Chebravo
//
//  Created by Phillip Lundin on 22/07/2022.
//

import Foundation
import SwiftUI

struct NavigationBarIconView : View {
    @ObservedObject var viewRouter : ViewRouterController

    @State var systemIconName: String

    let assignedPage: Page
    let width, height: CGFloat
    let color: Color

    private func GetIcon() -> String {
        return viewRouter.currentPage == assignedPage ? systemIconName + ".fill" : systemIconName
    }

    var body: some View {
        VStack {
            Image(systemName: GetIcon())
                .resizable()
                .scaledToFit()
                .frame(width: width, height: height)
                .padding(.top, 30)
                .foregroundColor(color)
        }
        .onTapGesture {
            viewRouter.currentPage = assignedPage
        }
    }

}
