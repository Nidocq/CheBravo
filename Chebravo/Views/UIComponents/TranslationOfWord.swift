//
//  TranslationOfWord.swift
//  Chebravo
//
//  Created by Phillip Lundin on 27/06/2022.
//

import SwiftUI

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
            Spacer()
            
            // This VStack is the balance the space between the italian word
            // and the english translated word
            VStack {
                WordName(name: self.Name)
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
            // ---
        }
    }
}

