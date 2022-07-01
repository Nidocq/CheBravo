//
//  WordComponents.swift
//  Chebravo
//
//  Created by Phillip Lundin on 01/07/2022.
//

import SwiftUI

///<summary> UIComponent Displays the name of the words with style </summary>
///<param name="name"> Text that needs to be displayed </param>
struct WordName: View {
    var name: String
    var body: some View {
        Text(self.name)
            .font(.system(size: 24))
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

/// <summary> Subview UIComponent that displays an italian word and its represented translated word </summary>
struct TranslationOfWord: View {
    var Name : String
    var WordType : String
    var ConjugationProcess : String
    var body: some View {
        HStack {
            // ---
            VStack(alignment: .leading) {
                WordSpecification(text: WordType)
                WordName(name: self.Name)
                WordSpecification(text: ConjugationProcess)
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
                .foregroundColor(.black)
            Spacer()
            
            // This VStack is the balance the space between the italian word
            // and the english translated word
            VStack {
                WordName(name: self.Name)
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
            .foregroundColor(.black)

            // ---
        }
    }
}
