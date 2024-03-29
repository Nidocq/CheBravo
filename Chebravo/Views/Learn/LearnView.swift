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
    @AppStorage("languageItalian") var languageItalian : Bool?

    init() {
        let navBarAppearance = UINavigationBar.appearance()
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor(Color("SecondaryColor"))]
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor(Color("SecondaryColor"))]
    }
    
    let columns : [GridItem] = [
        GridItem(.adaptive(minimum: 130))
    ]
    
    func ItalianTranslation() -> String {
        if (languageItalian ?? false) {
            return "Lezioni"
        } else {
            return "Modules"
        }
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("PrimaryColor")
                    .ignoresSafeArea()
                VStack {
                    // Having something in the VStack makes the title not
                    // go into compact mode hence empty Text
                    Text("")
                    ScrollView(showsIndicators: false) {
                        // TODO: Make the module display display the modules
                            // dynamically so there is less code
                        LazyVGrid(columns: columns, spacing: 0) {
                            NavigationLink(
                                destination: LearnNumbers()) {
                                ModuleDisplay(
                                    moduleName: ModuleNumbers.MATERIAL_TITLE,
                                    moduleNameIT: ModuleNumbers.MATERIAL_TITLE_IT,
                                    moduleIcon: ModuleNumbers.ICON_NAME
                                )
                            }

                            NavigationLink(
                                destination: LearnArticles()) {
                                ModuleDisplay(
                                    moduleName: ModuleArticles.MATERIAL_TITLE,
                                    moduleNameIT: ModuleArticles.MATERIAL_TITLE_IT,
                                    moduleIcon: ModuleArticles.ICON_NAME
                                )
                            }
                            
                            NavigationLink(destination: LearnPronunciation()) {
                                ModuleDisplay(
                                    moduleName: ModulePronunciation.MATERIAL_TITLE,
                                    moduleNameIT: ModulePronunciation.MATERIAL_TITLE_IT,
                                    moduleIcon: ModulePronunciation.ICON_NAME
                                )
                            }
                            
                            NavigationLink(destination: LearnAskingQuestions()) {
                                ModuleDisplay(
                                    moduleName: ModuleAskingQuestions.MATERIAL_TITLE,
                                    moduleNameIT: ModuleAskingQuestions.MATERIAL_TITLE_IT,
                                    moduleIcon: ModuleAskingQuestions.ICON_NAME
                                )
                            }
                            
                            NavigationLink(destination: LearnConjugation()) {
                                ModuleDisplay(
                                    // Material name is not the same as the displayed
                                    // Title in LearnView
                                    moduleName: "Common Verbs & Conjugations",
                                    moduleNameIT: ModuleConjugation.MATERIAL_TITLE_IT,
                                    moduleIcon: ModuleConjugation.ICON_NAME
                                )
                            }
                            
                            NavigationLink(destination: LearnPossession()) {
                                ModuleDisplay(
                                    moduleName: ModulePossession.MATERIAL_TITLE,
                                    moduleNameIT: ModulePossession.MATERIAL_TITLE_IT,
                                    moduleIcon: ModulePossession.ICON_NAME
                                )
                            }
                            
                            NavigationLink(destination: LearnTime()) {
                                ModuleDisplay(
                                    moduleName: ModuleTime.MATERIAL_TITLE,
                                    moduleNameIT: ModuleTime.MATERIAL_TITLE_IT,
                                    moduleIcon: ModuleTime.ICON_NAME
                                )
                            }
                            
                            NavigationLink(destination: LearnDirections()) {
                                ModuleDisplay(
                                    moduleName: ModuleDirections.MATERIAL_TITLE,
                                    moduleNameIT: ModuleDirections.MATERIAL_TITLE_IT,
                                    moduleIcon: ModuleDirections.ICON_NAME
                                )
                            }
                        }
                        .padding()
                    }
                }
                .foregroundColor(Color("SecondaryColor"))
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment:.leading)
                .padding([.leading, .trailing], 20)
            }
            .navigationTitle(ItalianTranslation())
        }
    }
}


/// <summary> Each modules' infographic display</summary>
/// <remarks> inpired by
/// https://assets.justinmind.com/wp-content/webp-express/webp-images/uploads/2019/10/list-ui-design-category-listing.png.webp </remarks>
struct ModuleDisplay : View {
    @AppStorage("languageItalian") var languageItalian : Bool?

    let moduleName : String
    let moduleNameIT : String?
    let moduleIcon : String
    
    // Should be var if expanded
    // Deprecated because no logic is implemented for complete badges
    let moduleCompleted : Bool = false
    let completedIconSize : CGFloat = 22
    
    // TODO: Refactor
    func ItalianTranslation() -> String {
        if(languageItalian ?? false) {
            return moduleNameIT ?? moduleName
        } else {
            return moduleName
        }
    }

    var body: some View {
        VStack {
            Image(systemName: moduleIcon)
                .font(.system(size: 30))
                .padding(.bottom, 4)
            Text(ItalianTranslation())
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
            
            ModuleDisplay(moduleName: "Hey there i am just programming my wayout of here", moduleNameIT: "Italian name", moduleIcon: "plus")
        }
    }
}

