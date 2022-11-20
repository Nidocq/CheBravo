//
//  LearnArticles.swift
//  Chebravo
//
//  Created by Phillip Lundin on 11/08/2022.
//

import SwiftUI

// TODO: Make the article transitions with an animation
// TODO: Make the masculine info graphic side by side with their representive
// article. like lo and gli are together and il and i are together
/// <summary> Articles as "The, a, an" and how to use them in Italian </summary>
struct ModuleArticles : ILearning {
    var id: UUID = UUID()
    
    static let MATERIAL_TITLE : String = "Articles"
    static let ICON_NAME : String = "textformat.subscript"
    let paddingLeftRight : CGFloat = 14
    let titleSize : CGFloat = 22
    let cornerRadiusAmount : CGFloat = 10
    @State var DefiniteIndefinite : String = "Definite"
    @State var isDefinite : Bool = true

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
            // Makes up for the definite and indefinite change when the
            // button is pressed
            if (self.isDefinite) {
                // la l' le
                VStack {
                    VStack {
                        Text("♀")
                        Text("Feminine articles")
                            .font(.system(size: titleSize))
                            .bold()
                        
                        VStack {
                            Text("Article \"la\" is used for every feminine article, unless there is a vovel then we use \"l\'\". If you talk about several nouns, \"le\" is the article to describe the plural")
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                            Text("Remember that the end character \'a\' changes to \'e\' in the pluaral form")
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                        }
                        .font(.system(size: 18))
                    }
                    .padding(.bottom, 20)
                    .font(.system(size: 40))
                    
                    // Individual infographics for the Articles for feminine
                    VStack {
                        Text(DefiniteIndefinite)
                            .italic()
                            .font(.system(size: 16))
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                        ArticleType (
                            Article: "la",
                            SingularOrPlural: AnyView(SuperscriptSingular),
                            ExampleIT: "la mattina",
                            ExampleEN: "The morning"
                        )
                        
                        ArticleType(
                            Article: "l\'",
                            SingularOrPlural: AnyView(SuperscriptSingular),
                            ExampleIT: "l\'isola",
                            ExampleEN: "The island"
                        )
                        
                        ArticleType(
                            Article: "le",
                            SingularOrPlural: AnyView(SuperscriptPlural),
                            ExampleIT: "le mattine",
                            ExampleEN: "The mornings",
                            SecondaryExampleIT: "le isole",
                            SecondaryExampleEN: "The islands"
                        )
                        
                        ShowButton(
                            isDefinite: $isDefinite,
                            DefiniteIndefinite: $DefiniteIndefinite,
                            cornerRadiusAmount: cornerRadiusAmount
                        )
                        
                        
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                }
            } else {
                // una un'
                VStack {
                    VStack {
                        Text("♀")
                        Text("Feminine articles")
                            .font(.system(size: titleSize))
                            .bold()
                        
                        VStack {
                            Text("Una is used for all the indefinite (no direct reference to a noun) article, but if a vowel is in front of the word, \"un'\" is used.")
                                .font(.system(size: 18))
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                    }
                    .padding(.bottom, 20)
                    .font(.system(size: 40))
                    
                    // Individual infographics for the Articles for feminine
                    VStack {
                        Text(DefiniteIndefinite)
                            .italic()
                            .font(.system(size: 16))
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                        ArticleType (
                            Article: "una",
                            SingularOrPlural: AnyView(SuperscriptSingular),
                            ExampleIT: "Una mattina",
                            ExampleEN: "A morning"
                        )
                        
                        ArticleType(
                            Article: "un'",
                            SingularOrPlural: AnyView(SuperscriptSingular),
                            ExampleIT: "Un\'isola",
                            ExampleEN: "An island"
                        )
                        
                        ArticleType(
                            Article: "le",
                            SingularOrPlural: AnyView(SuperscriptPlural),
                            ExampleIT: "le mattine",
                            ExampleEN: "The mornings",
                            isHidden: true
                        )
                        
                        ShowButton(
                            isDefinite: $isDefinite,
                            DefiniteIndefinite: $DefiniteIndefinite,
                            cornerRadiusAmount: cornerRadiusAmount
                        )
                        
                        
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                }
            }
        }
        .foregroundColor(Color("SecondaryColor"))
        .padding([.leading, .trailing], paddingLeftRight)
        
        VStack(spacing:0) {
            Seperator()
                .padding(.bottom, 20)
                .padding(.top, 40)
            
            if (self.isDefinite) {
                // il, i, lo, gli
                VStack {
                    VStack {
                        Text("♂")
                        Text("Masculine articles")
                            .font(.system(size: titleSize))
                            .bold()
                        VStack {
                            Text("il is the singular of the masculine article. \'i\' is the plural of \"il\". The msculine article have a second article: \"lo\", which is used when the begining of the noun is")
                            Text("x, y, z, gn, pn, ps, st")
                            Text("The plural form of \"lo\" is \"gli\" [pronounced jli]")
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                        }
                        .font(.system(size: 18))
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                        
                    }
                    .padding(.bottom, 20)
                    .font(.system(size: 40))
                    
                    // Individual infographics for the Articles for masculine
                    VStack {
                        Text(DefiniteIndefinite)
                            .italic()
                            .font(.system(size: 16))
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                        ArticleType (
                            Article: "il",
                            SingularOrPlural: AnyView(SuperscriptSingular),
                            ExampleIT: "il libro",
                            ExampleEN: "The book"
                        )
                        
                        ArticleType(
                            Article: "i",
                            SingularOrPlural: AnyView(SuperscriptPlural),
                            ExampleIT: "i libri",
                            ExampleEN: "The books"
                        )
                        
                        ArticleType(
                            Article: "lo",
                            SingularOrPlural: AnyView(SuperscriptSingular),
                            ExampleIT: "lo",
                            ExampleEN: "The studente"
                        )
                        
                        ArticleType(
                            Article: "gli",
                            SingularOrPlural: AnyView(SuperscriptPlural),
                            ExampleIT: "gli studenti",
                            ExampleEN: "The students"
                        )
                        
                        ShowButton(
                            isDefinite: $isDefinite,
                            DefiniteIndefinite: $DefiniteIndefinite,
                            cornerRadiusAmount: cornerRadiusAmount
                        )
                        
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                }
            } else {
                // Uno, un
                VStack {
                    VStack {
                        Text("♂")
                        Text("Masculine articles")
                            .font(.system(size: titleSize))
                            .bold()
                        VStack {
                            Text("Every indefinite masculine article has the \"uno\" article in front of them, unless a vowel is in the beginning of the next word")
                                .font(.system(size: 18))
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                        
                    }
                    .padding(.bottom, 20)
                    .font(.system(size: 40))
                    
                    // Individual infographics for the Articles for masculine
                    VStack {
                        Text(DefiniteIndefinite)
                            .italic()
                            .font(.system(size: 16))
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                        ArticleType (
                            Article: "uno",
                            SingularOrPlural: AnyView(SuperscriptSingular),
                            ExampleIT: "uno studente",
                            ExampleEN: "A student",
                            SecondaryExampleIT: "uno libro",
                            SecondaryExampleEN: "A book"
                        )
                        
                        ArticleType(
                            Article: "un",
                            SingularOrPlural: AnyView(SuperscriptPlural),
                            ExampleIT: "un zanito",
                            ExampleEN: "??"
                        )
                        
                        ArticleType(
                            Article: "lo",
                            SingularOrPlural: AnyView(SuperscriptSingular),
                            ExampleIT: "",
                            ExampleEN: "",
                            isHidden: true
                        )
                        
                        ArticleType(
                            Article: "gli",
                            SingularOrPlural: AnyView(SuperscriptPlural),
                            ExampleIT: "le mattine",
                            ExampleEN: "The mornings",
                            isHidden: true
                        )
                        
                        ShowButton(
                            isDefinite: $isDefinite,
                            DefiniteIndefinite: $DefiniteIndefinite,
                            cornerRadiusAmount: cornerRadiusAmount
                        )
                        
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                }
            }

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
    var SecondaryExampleIT : String? = nil
    var SecondaryExampleEN : String? = nil
    let paddingAllAround : CGFloat = 14
    var isHidden : Bool = false
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
            if (SecondaryExampleEN != nil && SecondaryExampleIT != nil) {
                LearningExample(
                    ItalianExample: SecondaryExampleIT ?? "",
                    EnglishTranslation: SecondaryExampleEN ?? "",
                    TextSize: 16
                )
                .padding([.leading, .trailing, .bottom], 10)
            }
        }
        .foregroundColor(Color("PrimaryColor"))
        .border(Color("SecondaryColor"), width: 2)
        .if(isHidden) { elem in
            elem
                .redacted(reason: .placeholder)
                .border(Color("SecondaryColor"), width: 0)
                .opacity(0.5)

        }
    }
}

struct ShowButton : View {
    @Binding var isDefinite : Bool
    @Binding var DefiniteIndefinite : String
    func GetInverse() -> String {
        if (self.DefiniteIndefinite == "Definite") {
            return "Indefinite"
        } else {
            return "Definite"
        }
    }
    
    let cornerRadiusAmount : CGFloat
    var body: some View {
        Button {
            withAnimation {
                self.DefiniteIndefinite = GetInverse()
                self.isDefinite.toggle()
                
            }
        } label: {
            Text("Show \(GetInverse()) articles")
                .bold()
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color("SecondaryColor"))
                .cornerRadius(cornerRadiusAmount)
                .foregroundColor(Color("PrimaryColor"))

        }
        .padding(.top, 20)
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
