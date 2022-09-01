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
            .padding()
            .foregroundColor(Color("SecondaryColor"))
        VStack(spacing:0) {
            Text("♀")
                .padding()
                .font(.system(size: 40))
            
            
                // Female
                VStack(alignment: .leading) {
                    Text("la, le, l'")
                        .underline()
                        .bold()
                        .padding(.bottom, 10)
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Image(systemName: "person")
                            Text("singular")
                                .bold()
                                .font(.system(size: 12))
                                .baselineOffset(-20.0)
                            
                        }
                        LearningExample(
                            ItalianExample: "il libro",
                            EnglishTranslation: "the book")
                        .font(.system(size: 12))
                        .frame(maxWidth: .infinity, maxHeight: 30)
                        .padding(0)
                        .offset(x: 30)
                    }
                    .foregroundColor(Color("PrimaryColor"))
                    .background(Color("SecondaryColor"))
                        
                    HStack {
                        Image(systemName: "person.3.sequence")
                        Text("plural")
                            .bold()
                            .font(.system(size: 12))
                            .baselineOffset(-20.0)
                    }
                        
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)

               
                // Male
                VStack(alignment: .leading) {
                    Text("il, i, lo, gli, l'")
                        .underline()
                        .bold()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)

            .padding()
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

struct LearnArticles_Previews: PreviewProvider {
    static var previews: some View {
        LearnArticles()
    }
}
