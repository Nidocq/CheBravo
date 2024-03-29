//
//  LearnPronunciation.swift
//  Chebravo
//
//  Created by Phillip Lundin on 28/08/2022.
//

import SwiftUI

struct ModulePronunciation: ILearning {
    
    @AppStorage("languageItalian") var languageItalian : Bool?
    var id: UUID = UUID()
    private let AC : AudioController = AudioController()
    static var MATERIAL_TITLE: String = "Pronunciation"
    static var MATERIAL_TITLE_IT: String = "La Pronuncia"
    static var ICON_NAME : String = "message"
    
    
    var body: some View {
        VStack(spacing: 24) {
            VStack(spacing: 0) {
            Text("Italians use 'c' extensively, so when it comes to pronunciation is vital to pronunce it right. This module includes IPA pronunciation techniques. We advice to read more on IPA")
                    .padding(.bottom)
                Button {
                    if let url = URL(string: "https://en.wikipedia.org/wiki/International_Phonetic_Alphabet") {
                        UIApplication.shared.open(url)
                    }
                } label: {
                    Text("IPA")
                        .underline()
                        .foregroundColor(.blue)
                        .frame(width: 70, height: 30)
                        .background(Color("SecondaryColor"))
                        .cornerRadius(10)
                }
            }
            
            // Pronunciation graphics together c and ch makes k
            VStack {
                HStack(spacing: 30) {
                    PronunciationGraphic(
                        pronouncingWord: "c",
                        firstVowel: "a",
                        secondVowel: "u",
                        thirdVowel: "o"
                    )
                    Text("and")
                        .padding(.trailing, -10)
                    PronunciationGraphic(
                        pronouncingWord: "ch",
                        firstVowel: "i",
                        secondVowel: "e"
                    )
                }
                
                VStack {
                    Image(systemName: "arrow.down")
                        .font(.system(size: 38))
                        .padding(.bottom, 20)
                    
                    
                    WordPronunciation(
                        pronunciation: "k [k]",
                        audioName: "k.mp3",
                        audioController: AC
                    )
                    
                    
                }
                
                VStack(spacing: 0) {
                    LearningExample(
                        ItalianExample: "Vuoi una caramella? [kaɾamˈɛlla]",
                        EnglishTranslation: "Do you want a candy?"
                    )
                    .padding(.bottom)
                    LearningExample(
                        ItalianExample: "Che [k'e] cosa [kˈɔza] stai facendo?",
                        EnglishTranslation: "What are you doing?"
                    )
                    .padding(.bottom)
                    LearningExample(
                        ItalianExample: "Chi [ki] è che cucina? [kʊt͡ʃˈina]",
                        EnglishTranslation: "Who's cooking?"
                    )
                }
                .padding([.leading, .trailing])
                .padding(.top, 16)
                .padding(.bottom, 50)
            }
            
            Seperator()
            
            // Pronunciation graphics together c and ci makes ci
            VStack {
                HStack(spacing: 30) {
                    PronunciationGraphic(
                        pronouncingWord: "c",
                        firstVowel: "i",
                        secondVowel: "e"
                    )
                    Text("and")
                        .padding(.trailing, -10)
                    PronunciationGraphic(
                        pronouncingWord: "ci",
                        firstVowel: "a",
                        secondVowel: "u",
                        thirdVowel: "o"
                    )
                }
                
                VStack {
                    Image(systemName: "arrow.down")
                        .font(.system(size: 38))
                        .padding(.bottom, 20)
                    
                    WordPronunciation(
                        pronunciation: "tch [tʃ]",
                        audioName: "tch.mp3",
                        audioController: AC
                    )
                }
                
                VStack(spacing: 0) {
                    LearningExample(
                        ItalianExample: "Noi andiamo ancora? [anˈko.ra]",
                        EnglishTranslation: "Are we going again?"
                    )
                    .padding(.bottom)
                    LearningExample(
                        ItalianExample: "Noi andiamo ancora? [anˈko.ra]",
                        EnglishTranslation: "Are we going again?"
                    )
                    .padding(.bottom)
                    LearningExample(
                        ItalianExample: "Noi andiamo ancora? [anˈko.ra]",
                        EnglishTranslation: "Are we going again?"
                    )
                }
                .padding([.leading, .trailing])
                .padding(.top, 16)
                .padding(.bottom, 50)
            }
            
            
            
        }
        .foregroundColor(Color("SecondaryColor"))
    }
}


struct PronunciationGraphic : View {
    private var pronouncingWord : String
    private var firstVowel : String
    private var secondVowel : String
    private var thirdVowel : String?
    
    init(
        pronouncingWord : String,
        firstVowel: String,
        secondVowel : String,
        thirdVowel : String? = nil) {
        self.pronouncingWord = pronouncingWord
        self.firstVowel = firstVowel
        self.secondVowel = secondVowel
        self.thirdVowel = thirdVowel
    }
    var body: some View {
        HStack {
            Text(pronouncingWord)
                .font(.system(size: 20))
                .bold()
                .italic()
            
            Text("}")
                .font(.system(size: 40))
            VStack {
                if !(self.thirdVowel == nil) {
                    Text(firstVowel)
                        .offset(y: 10)
                    Text(secondVowel)
                        .offset(x: 14)
                    Text(thirdVowel!)
                        .offset(y: -10)
                } else {
                    Text(firstVowel)
                    Text(secondVowel)
                }
            }
        }
    }
}

struct WordPronunciation : View {
    let pronunciation : String
    let audioName : String
    let audioController : AudioController
    private let BUTTON_PADDING : CGFloat = 80
    var body: some View {
        VStack {
            Text("Is pronounced")
            Text(pronunciation)
                .font(.system(size: 22))
                .bold()
            
            Rectangle()
                .frame(maxWidth: .infinity, maxHeight: 2)
                
            Button {
                audioController.playAudio(name: audioName)
            } label: {
                HStack {
                    Text("Pronunciation ")
                    Image(systemName: "speaker.wave.2.fill")
                }
                .padding([.top, .bottom], 6)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }

        }
        .foregroundColor(Color("PrimaryColor"))
        .padding(.top, 8)
        .padding([.top, .bottom], 6)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("SecondaryColor"))
        .cornerRadius(10)
        .padding([.leading, .trailing], BUTTON_PADDING)
    }
}


// MARK: Boilerplate and Previews
struct LearnPronunciation : View {
    
    var body: some View {
        LearningMaterialBoilerPlate(
            ModuleContent: AnyView(ModulePronunciation()),
            MATERIAL_TITLE: ModulePronunciation.MATERIAL_TITLE,
            MATERIAL_TITLE_IT: ModulePronunciation.MATERIAL_TITLE_IT
        )
    }
}


struct LearnPronunciation_Previews: PreviewProvider {
    static var previews: some View {
        LearnPronunciation()
    }
}
