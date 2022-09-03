//
//  Extensions.swift
//  Chebravo
//
//  Created by Phillip Lundin on 29/06/2022.
//

import Foundation
import SwiftUI

// MARK: Enums
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


// MARK: Learning material extensions
/// <summary> BoilerPlate used for all the material that all the modules have
/// in common in order to DRY </summary>
/// <remarks>
/// - Provides Background color on the main view that calls .infinify on Zstack
/// - Two tab icons
///     - Back button for going back the all the modules
/// - Hiding the navigationBar
/// - Setting the navigationTitle to MATERIAL_TITLE
/// </remarks>
/// <param name="ModuleContent"> A View which is the specific module content
/// </param>
/// <param name="MATERIAL_TITLE"> The name of the module </param>
struct LearningMaterialBoilerPlate : View {
    @Environment(\.dismiss) var dismiss
    var ModuleContent : AnyView
    let MATERIAL_TITLE : String 
    
    init(ModuleContent : AnyView, MATERIAL_TITLE : String) {
        self.ModuleContent = ModuleContent
        self.MATERIAL_TITLE = MATERIAL_TITLE
    }
    
    var body: some View {
        ZStack {
            Color("PrimaryColor")
                .ignoresSafeArea()
            VStack {
                Text("")
                ScrollView {
                    // Embed the module here
                    self.ModuleContent
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        
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
        .navigationTitle(self.MATERIAL_TITLE)
    }
}

struct LearningHeading : View {
    var subTitle : String? = nil
    
    // Making this an optional parameter
    init(subTitle : String? = nil) {
        self.subTitle = subTitle
        
    }
    
    var body: some View {
        VStack {
            HStack {
                Text("Examples")
                    .fontWeight(.heavy)
                    .underline()
                Image(systemName: "text.magnifyingglass")
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            .font(.system(size: 30))
            .foregroundColor(Color("SecondaryColor"))
            if self.subTitle != nil {
                Text(self.subTitle!)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                    .foregroundColor(Color("SecondaryColor"))
                    .padding(.bottom, 4)
            }
        }
    }
}
    

/// <summary> Info graphic for the learning modules that translates examples
/// that are associated with the specific module </summary>
struct LearningExample : View {
    var ItalianExample : String
    var EnglishTranslation : String
    var TextColor : Color = Color("SecondaryColor")
    var TextSize : CGFloat = 18
    
    var body : some View {
        VStack(alignment: .leading) {
            
            Text(ItalianExample)
                .fontWeight(.bold)
                .font(.system(size: TextSize))

            
            VStack {
                HStack {
                    Image(systemName: "arrow.turn.down.right")
                        .padding(.leading, 30)
                    Text(EnglishTranslation)
                }
                .font(.system(size: TextSize))
            }
        }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            .foregroundColor(TextColor)
    }
}

struct Seperator : View {
    var paddingLeadingTrailing : CGFloat = 20 + 10
    
    var body: some View {
        Rectangle()
            .frame(
                width: UIScreen.main.bounds.width-paddingLeadingTrailing*2,
                height: 2
            )
            .foregroundColor(Color("SecondaryColor"))
    }
}


// MARK: Universal settings
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


// https://www.avanderlee.com/swiftui/conditional-view-modifier/

// Example :
//  Text("Hello there i am love")
//    .if(true) { view in
//        Text("This is another")
//          or if you want to style this view (Which is a Text)
//          view
//              .font(.system(size: 33))
//    }
extension View {
    /// Applies the given transform if the given condition evaluates to `true`.
    /// - Parameters:
    ///   - condition: The condition to evaluate.
    ///   - transform: The transform to apply to the source `View`.
    /// - Returns: Either the original `View` or the modified `View` if the condition is `true`.
    @ViewBuilder func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}


