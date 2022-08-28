//
//  Extensions.swift
//  Chebravo
//
//  Created by Phillip Lundin on 29/06/2022.
//

import Foundation
import SwiftUI


/// Word type
enum WordType : String {
    case adjective = "Adjective"
    case noun = "Noun"
    case verb = "Verb"
}

enum ConjugationProcess : String {
    case first = "are"
    case second = "ere"
    case third = "ire"
}

enum ViewOptions: String, CaseIterable {
    case translation = "Translation"
    case compact = "Compact"

}

struct LearningMaterialBoilerPlate : View {
    @Environment(\.dismiss) var dismiss
    var ModuleContent : AnyView
    
    init(ModuleContent : AnyView) {
        self.ModuleContent = ModuleContent
    }
    
    var body: some View {
        ZStack {
            Color("PrimaryColor")
                .ignoresSafeArea()
            ModuleContent
        }
        
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    
                } label: {
                    Image(systemName: "list.bullet")
                        .foregroundColor(Color("SecondaryColor"))
                }
            }
            
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                    HStack {
                        Image(systemName: "chevron.left")
                        Text(" Back")
                    }
                    .foregroundColor(Color("SecondaryColor"))
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

// For reference, fixing the swiping feature if the NavigationView is hidden
// https://stackoverflow.com/questions/59921239/hide-navigation-bar-without-losing-swipe-back-gesture-in-swiftui
extension UINavigationController: UIGestureRecognizerDelegate {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }

    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
}
