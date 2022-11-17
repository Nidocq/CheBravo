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
    let paddingLeftRight : CGFloat = 14
    let titleSize : CGFloat = 22

    var body: some View {
        VStack(alignment: .leading) {
            Text("Articles clarifies the condition of a noun, like how many there are, or if you refer to a specific thing or not. English has only 2 articles: **\"the\"** and **'a'**, but Italian has a 7 articles! They are listed below on how they are used")
                
        }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            .padding([.trailing, .leading], paddingLeftRight)
            .padding(.bottom, 18)
            .foregroundColor(Color("SecondaryColor"))
        
        VStack(spacing:0) {
            Seperator()
                .padding(.bottom, 15)
            VStack {
                Text("♀")
                Text("Feminine articles")
                    .font(.system(size: titleSize))
                    .bold()
                VStack {
                    Text("Article \"la\" is used for every feminine article, unless there is a vovel then we use \"l\'\". If you talk about several nouns, \"le\" is the article to describe the plural")
                        .font(.system(size: 18))
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            }
                .padding(.bottom, 20)
                .font(.system(size: 40))
            
            // Individual infographics for the Articles
            VStack {
                Text("Definite")
                    .italic()
                    .font(.system(size: 16))
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                ArticleType (
                    Article: "la",
                    SingularOrPlural: SuperscriptSingular as! AnyView,
                    ExampleIT: "la mattina",
                    ExampleEN: "The morning"
                )
                
                ArticleType(
                    Article: "l\'",
                    SingularOrPlural: SuperscriptSingular as! AnyView,
                    ExampleIT: "l\'isola",
                    ExampleEN: "The island"
                )
                
                ArticleType(
                    Article: "le",
                    SingularOrPlural: SuperscriptPlural as! AnyView,
                    ExampleIT: "le mattine",
                    ExampleEN: "The mornings"
                    // TODO: Optional argument paramaeter for le isole
                )
                
                Button {
                    //code
                } label: {
                    Text("Show indefine articles")
                        .foregroundColor(Color("PrimaryColor"))
                        .bold()
                        .padding(.top, 16)
                        .frame(width: 230, height: 50)
                        .background(Color("SecondaryColor"))
                        .cornerRadius(11)
                }
                //TODO: Make text in the middle of button
                .padding(.top, 20)

                
            }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
        }
        .foregroundColor(Color("SecondaryColor"))
        .padding([.leading, .trailing], paddingLeftRight)
        // TODO: Make toggle button for the indefinite (uno una un etc) articles
        // removing the plural and chaning la and l' to una un' as well as the examples.
        
        VStack(spacing:0) {
            Seperator()
                .padding(.bottom, 20)
                .padding(.top, 40)
            VStack {
                Text("♂")
                Text("Masculine articles")
                    .font(.system(size: titleSize))
                    .bold()
                VStack {
                    Text("lo and")
                        .font(.system(size: 18))
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                
            }
                .padding(.bottom, 20)
                .font(.system(size: 40))
            
            // Individual infographics for the Articles
            VStack {
                ArticleType (
                    Article: "lo",
                    SingularOrPlural: SuperscriptSingular as! AnyView,
                    ExampleIT: "la mattina",
                    ExampleEN: "The morning"
                )
                
                ArticleType(
                    Article: "gli",
                    SingularOrPlural: SuperscriptSingular as! AnyView,
                    ExampleIT: "l\'isola",
                    ExampleEN: "The island"
                )
                
                ArticleType(
                    Article: "le",
                    SingularOrPlural: SuperscriptPlural as! AnyView,
                    ExampleIT: "le mattine",
                    ExampleEN: "The mornings"
                    // TODO: Optional argument paramaeter for le isole
                )
                
            }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
        }
        .foregroundColor(Color("SecondaryColor"))
        .padding([.leading, .trailing], paddingLeftRight)
        
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

struct ArticleType: View {
    var Article : String
    var SingularOrPlural : AnyView
    var ExampleIT : String
    var ExampleEN : String
    let paddingAllAround : CGFloat = 14
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text(Article)
                    .italic()
                    .bold()
                    .font(.system(size: 22))
                SingularOrPlural
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            .padding(paddingAllAround)
            .background(Color("SecondaryColor"))
            LearningExample(
                ItalianExample: ExampleIT,
                EnglishTranslation: ExampleEN,
                TextSize: 16
            )
            .padding(10)
        }
        .foregroundColor(Color("PrimaryColor"))
        .border(Color("SecondaryColor"), width: 2)
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
