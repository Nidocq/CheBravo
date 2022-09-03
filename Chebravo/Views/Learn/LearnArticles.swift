//
//  LearnArticles.swift
//  Chebravo
//
//  Created by Phillip Lundin on 11/08/2022.
//

import SwiftUI

/// <summary> Articles as "The, a, an" and how to use them in Italian </summary>
struct ModuleArticles : ILearning {
    var id: UUID = UUID()
    
    static let MATERIAL_TITLE : String = "Articles"
    static let ICON_NAME : String = "textformat.subscript"
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Articles clarifies the condition of a noun, like how many there are, or if you refer to a specific thing or not.")
            Text("English has only 2 articles: **\"the\"** and **'a'**")
            Text("But Italian has a 7 articles! They are listed below on how they are used")
                
        }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            .padding([.trailing, .leading, .bottom], 18)
            .foregroundColor(Color("SecondaryColor"))
        VStack(spacing:0) {
            Seperator()
            VStack {
                Text("♀")
                Text("Feminine articles")
                    .font(.system(size: 18))
                
            }
                .padding()
                .font(.system(size: 40))
            
            HStack {
                VStack {
                    VStack(spacing: 0) {
                        HStack {
                            Text("***la***")
                                .underline()
                                .font(.system(size: 22))
                            SuperscriptSingular
                        }
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                            .padding()
                            .background(Color("SecondaryColor"))
                    LearningExample(
                        ItalianExample: "la matita",
                        EnglishTranslation: "The morning",
                        TextSize: 16
                    )
                        .padding(10)
                    }
                    .foregroundColor(Color("PrimaryColor"))
                    .border(Color("SecondaryColor"), width: 2)
                    
                    HStack {
                    Text("**l\'**")
                        .underline()
                        .font(.system(size: 22))
                        SuperscriptSingular
                    }
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                LearningExample(ItalianExample: "l\'isola", EnglishTranslation: "The island")
                    
                }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                    .padding(.leading)
                
                
                Spacer()
                Image(systemName: "arrow.right")
                Spacer()
                VStack {
                    HStack {
                        Text("**le**")
                            .underline()
                            .font(.system(size: 22))
                        SuperscriptPlural
                    }
                    LearningExample(ItalianExample: "le matine", EnglishTranslation: "The mornings")
                        .frame(maxWidth: .infinity, maxHeight: 40)
                    LearningExample(ItalianExample: "l'isole", EnglishTranslation: "The islands")
                        .frame(maxWidth: .infinity, maxHeight: 40)
                    
                }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                    
            }
        }
        .foregroundColor(Color("SecondaryColor"))
    }
}

/// <summary> Boiler plate implementation with the module constructed above
/// </summary>
struct LearnArticles: View {
    var body: some View {
        LearningMaterialBoilerPlate(
            ModuleContent: AnyView(ModuleArticles()),
            MATERIAL_TITLE: ModuleArticles.MATERIAL_TITLE
        )
    }
}

extension ModuleArticles {
    private var SuperscriptSingular : some View {
        HStack {
            Image(systemName: "person")
            Text("singular")
                .bold()
                .font(.system(size: 12))
        }
        .offset(y: -12)
    }
    
    private var SuperscriptPlural : some View {
        HStack {
            Image(systemName: "person.3.sequence")
            Text("plural")
                .bold()
                .font(.system(size: 12))
        }
        .offset(y: -12)
    }
    
}

struct LearnArticles_Previews: PreviewProvider {
    static var previews: some View {
        LearnArticles()
    }
}
