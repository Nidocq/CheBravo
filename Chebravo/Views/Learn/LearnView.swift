//
//  LearnView.swift
//  Chebravo
//
//  Created by Phillip Lundin on 22/07/2022.
//

import SwiftUI

struct LearnView: View {
    
//    var LearningMaterial : [ILearning] = [
//        LearnNumbers() // * All the numbers in italian
//        // LearnArticles()  * Articles feminine and their conjugation
//    ]
    
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
                
                
//                ForEach(LearningMaterial, id: \.id) { mat in
//
//                }
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 10) {
                        NavigationLink(
                            destination: LearnNumbers()) {
                            ModuleDisplay(
                                moduleName: "Numbers",
                                moduleIcon:"textformat.123"
                            )
                        }

                        NavigationLink(
                            destination: LearnArticles()) {
                            ModuleDisplay(
                                moduleName: "Articles",
                                moduleIcon:"textformat.subscript"
                            )
                        }
                        
                        NavigationLink(destination: LearnArticles()) {
                            ModuleDisplay(
                                moduleName: "Something else",
                                moduleIcon:"textformat.123"
                            )
                        }
                    }
                }
                .foregroundColor(Color("SecondaryColor"))
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment:.leading)
                .padding([.leading, .trailing], 20)
            }
            .navigationTitle("Learn")
        }
    }
}


/// <summary> Each modules' display which will be displayed in a list </summary>
/// <remarks> inpired by
/// https://assets.justinmind.com/wp-content/webp-express/webp-images/uploads/2019/10/list-ui-design-category-listing.png.webp </remarks>
struct ModuleDisplay : View {
    let moduleName : String
    let moduleIcon : String
    var body: some View {
        VStack{
            Image(systemName: moduleIcon)
                .font(.system(size: 30))
            Text(moduleName)
                .font(.system(size: 18))
                .bold()
                .fixedSize(horizontal: false, vertical: true)
        }
        .frame(width: 160, height: 160)
        .border(Color("SecondaryColor"))
    }
}

struct LearnView_Previews: PreviewProvider {
    static var previews: some View {
        LearnView()
    }
}
