//
//  LearnView.swift
//  Chebravo
//
//  Created by Phillip Lundin on 22/07/2022.
//

import SwiftUI

/// <summary> All modules of the italian lanugage will be stored here.
/// Clicking on one of the modules will take you to the specific module
/// </summary>
struct LearnView: View {
    // TODO: When emphazise words with an apostroph to indicate
    init() {
        let navBarAppearance = UINavigationBar.appearance()
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor(Color("SecondaryColor"))]
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor(Color("SecondaryColor"))]
    }
    
    let columns : [GridItem] = [
        GridItem(.adaptive(minimum: 130))
    ]
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("PrimaryColor")
                    .ignoresSafeArea()
                
                ScrollView(showsIndicators: false) {
                    // TODO: Make the module display display the modules
                        // dynamically so there is less code
                    LazyVGrid(columns: columns, spacing: 0) {
                        NavigationLink(
                            destination: LearnNumbers()) {
                            ModuleDisplay(
                                moduleName: "Numbers",
                                moduleIcon: "textformat.123"
                            )
                        }

                        NavigationLink(
                            destination: LearnArticles()) {
                            ModuleDisplay(
                                moduleName: "Definite Articles",
                                moduleIcon: "textformat.subscript"
                            )
                        }
                        
                        NavigationLink(destination: LearnPronunciation()) {
                            ModuleDisplay(
                                moduleName: "Pronunciation",
                                moduleIcon: "message"
                            )
                        }
                        
                        NavigationLink(destination: LearnAskingQuestions()) {
                            ModuleDisplay(
                                moduleName: "Asking Questions",
                                moduleIcon: "questionmark"
                            )
                        }
                        
                        NavigationLink(destination: LearnConjugation()) {
                            ModuleDisplay(
                                moduleName: "Common Verbs & Conjugations",
                                moduleIcon: "table"
                            )
                        }
                        
                        NavigationLink(destination: LearnPossession()) {
                            ModuleDisplay(
                                moduleName: "Possessive Adjectives",
                                moduleIcon: "figure.wave"
                            )
                        }
                        
                        NavigationLink(destination: LearnTime()) {
                            ModuleDisplay(
                                moduleName: "Talking About Time",
                                moduleIcon: "clock"
                            )
                        }
                        
                        NavigationLink(destination: LearnDirections()) {
                            ModuleDisplay(
                                moduleName: "Directions",
                                moduleIcon: "arrow.up.right.and.arrow.down.left.rectangle"
                            )
                        }
                    }
                    .padding()
                }
                .foregroundColor(Color("SecondaryColor"))
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment:.leading)
                .padding([.leading, .trailing], 20)
            }
            .navigationTitle("Learn")
        }
    }
}


/// <summary> Each modules' infographic display</summary>
/// <remarks> inpired by
/// https://assets.justinmind.com/wp-content/webp-express/webp-images/uploads/2019/10/list-ui-design-category-listing.png.webp </remarks>
struct ModuleDisplay : View {
    let moduleName : String
    let moduleIcon : String
    let completedIconSize : CGFloat = 22
    
    // Should be var if expanded
    // Deprecated because no logic is implemented for complete badges
    let moduleCompleted : Bool = false

    var body: some View {
        VStack {
            Image(systemName: moduleIcon)
                .font(.system(size: 30))
                .padding(.bottom, 4)
            Text(moduleName)
                .font(.system(size: 18))
                .bold()
                .padding([.trailing, .leading], 10)
                .fixedSize(horizontal: false, vertical: true)
        }
        .frame(width: 164, height: 164)
        .border(Color("SecondaryColor"))
        .foregroundColor(Color("SecondaryColor"))
        .overlay(
            Image(systemName: "checkmark.seal.fill")
                .frame(
                    width: completedIconSize,
                    height: completedIconSize,
                    alignment: .leading
                )
                .padding(8)
                .opacity( moduleCompleted ? 1 : 0 )
            , alignment: .topLeading)
       
        
    }
}

struct LearnView_Previews: PreviewProvider {
    static var previews: some View {
        LearnView()
    }
}

struct ModuleDisplay_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color("PrimaryColor")
                .ignoresSafeArea()
            
            ModuleDisplay(moduleName: "Hey there i am just programming my wayout of here", moduleIcon: "plus")
        }
    }
}

