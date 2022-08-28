//
//  WordComponents.swift
//  Chebravo
//
//  Created by Phillip Lundin on 01/07/2022.
//

import SwiftUI


/// WordComponents are the various components found around the system
/// all are compiles in this file to not flood the other files

///<summary> UIComponent Displays the name of the words with style </summary>
///<param name="name"> Text that needs to be displayed </param>
struct WordName: View {
    var name: String
    var body: some View {
        Text(self.name)
            .font(.system(size: 18))
    }
}


/// <summary> Used to describe the classes and attributes of the word
/// e.g. if it is a verb, irregular or regular conjugated </summary>
/// <param name="text">text of which classes and attributes are specified in</param>
struct WordSpecification: View {
    var text: String
    var body: some View {
        Text(text)
            .opacity(0.5)
            .font(.system(size: 11))
    }
}

/// <summary> Subview UIComponent that displays an italian word and its represented translated word
/// based on its input </summary>
/// <param name="ViewOptionType"> The ViewOptionType enum that showcases words compactly or full size </param>
/// <remarks> component just leaves out the translated word if viewOption is compact </remarks>
struct WordDisplay: View {
    @ObservedObject var word : Word
    var ViewOptionType : ViewOptions
    
    var body: some View {
        
        switch ViewOptionType {
            case .translation:
                HStack {
                    // ---
                    VStack(alignment: .leading) {
//                        WordSpecification(text: WordType.verb.rawValue)
                        WordName(name: self.word.name ?? "Unkown")
//                        WordSpecification(text: ConjugationProcess.first.rawValue)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .foregroundColor(.black)
                    Spacer()
                    
                    // This VStack is the balance the space between the italian word
                    // and the english translated word
                    VStack {
                        WordName(name: self.word.translationToEnglish ?? "Loading..")
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .foregroundColor(.black)

                    // ---
                }
                .lineLimit(1) // To not wrap text if word is too long
            
            case .compact:
                VStack(alignment: .leading) {
//                    WordSpecification(text: WordType.verb.rawValue)
                    WordName(name: self.word.name ?? "Unkown")
//                    WordSpecification(text: ConjugationProcess.first.rawValue)
                        .frame(alignment: .trailing)
                }
                .lineLimit(1) 
                .frame(minWidth: 140, maxWidth: .infinity, minHeight: 40,  maxHeight: .infinity, alignment: .leading)
                .foregroundColor(.black)
        }
    }
}

