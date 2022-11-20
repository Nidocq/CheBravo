//
//  LearnAskingQuestions.swift
//  Chebravo
//
//  Created by Phillip Lundin on 28/08/2022.
//

import SwiftUI

struct ModuleAskingQuestions: ILearning {
    
    var id: UUID = UUID()
    static var MATERIAL_TITLE : String = "Asking Questions"
    static var MATERIAL_TITLE_IT: String = "Fare Domande"
    static var ICON_NAME : String = "questionmark"
    
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("Asking questions is the _**most important skill**_ to learn when learning a new language.")
                Text("It helps us getting help from natives!")
                    .padding(.bottom, 16)
                
                QuestionCard(CardTitle: "What is this", IconName: "I like cake", Question: "What is icecream", TranslatedQuestion: "Translated")
            }
            .padding()
            .foregroundColor(Color("SecondaryColor"))
        }
    }
}

struct LearnAskingQuestions : View {
    var body: some View {
        LearningMaterialBoilerPlate(
            ModuleContent: AnyView(ModuleAskingQuestions()),
            MATERIAL_TITLE: ModuleAskingQuestions.MATERIAL_TITLE)
        }
}


// MARK: Components
// inspired by https://dribbble.com/shots/18497681-Personal-Banking-Mobile-App
struct QuestionCard : View {
    @State private var isCardTurned : Bool = false
    @State private var width : CGFloat = 280
    let HEIGHT_VALLEY_RIGHT_CORNER : CGFloat = 40
    var CardTitle : String
    var IconName : String
    var Question : String
    var TranslatedQuestion : String
    var body: some View {
        ZStack {
            Color("PrimaryColor")
                .ignoresSafeArea()
            
            ZStack {
                // Drawing the card
                GeometryReader { geo in
                    Path { path in
                        let width = min(geo.size.width, geo.size.height)
                        path.addLines([
                            CGPoint(x: width * 0, y: 0),
                            CGPoint(x: width * 0, y: geo.size.height),
                            CGPoint(x: width * 1, y: geo.size.height),
                            CGPoint(x: width * 1, y: HEIGHT_VALLEY_RIGHT_CORNER),
                            CGPoint(x: width * 0.7, y: HEIGHT_VALLEY_RIGHT_CORNER),
                            CGPoint(x: width * 0.5, y: 0),
                            CGPoint(x: width * 0, y: 0),
                            ])
                        
                        path.move(to: CGPoint(x: width * 0.5, y: 500))
                    }
                    .stroke(Color("SecondaryColor"), style: StrokeStyle(lineWidth: 3, lineCap: .round, lineJoin: .round))
                }
                VStack(alignment: .leading) {
                    HStack(alignment: .top) {
                        Text(CardTitle)
                            .font(.system(size: 14))
                            .padding(.top, 6)
                        Spacer()
                        Image(systemName: IconName)
                            .offset(y: HEIGHT_VALLEY_RIGHT_CORNER)
                    }
                    .frame(maxWidth: .infinity, alignment: .top)
                    Spacer()
                    Text("Question")
                        .underline()
                        .font(.subheadline)
                        .opacity(0.5)
                        .padding(.bottom, 1)
                    Text(!isCardTurned ? Question : TranslatedQuestion)
                    Spacer()
                    Spacer()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                .padding()
            }
            .foregroundColor(Color("SecondaryColor"))
            .frame(width: width, height: 350)
        }
        .onTapGesture {
            withAnimation(.spring()) {
                isCardTurned.toggle()
            }
        }
    }
}


struct LearnAskingQuestions_Previews: PreviewProvider {
    static var previews: some View {
        LearnAskingQuestions()
    }
}

struct QuestionCard_Previews: PreviewProvider {
    static var previews: some View {
        QuestionCard(CardTitle: "What is this", IconName: "plus", Question: "What is icecream", TranslatedQuestion: "Translated")
    }
}
