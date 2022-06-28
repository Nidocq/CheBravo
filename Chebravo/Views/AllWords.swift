//
//  AllWords.swift
//  Chebravo
//
//  Created by Phillip Lundin on 26/06/2022.
//

import SwiftUI

struct AllWords: View {
    @State var words : [String] = ["Mangiare", "Sapere", "Avere"]
    @Environment(\.managedObjectContext) var modelContainer
    @State var isActive = true
    var body: some View {
        NavigationView {
            ZStack {
                Color("PrimaryColor")
                    .ignoresSafeArea()
                ScrollView {
                    ForEach(words, id: \.self) { word in
                        NavigationLink(destination: Verb(Name: word, WordType: "adj.", ConjugationProcess: "re.")) {
                            TranslationOfWord(Name: word, WordType: "Verb.", ConjugationProcess: "re.")
                            .padding()
                            .background(.white)
                            .cornerRadius(10)
                            .padding([.leading, .trailing], 10)
                            .foregroundColor(.black)
                        }
                    }
                }
            }
            .toolbar {
                Button {
                    // TODO: Make the button add a new word
                    withAnimation {
                        isActive.toggle()
                    }
                } label: {
                    Image(systemName: "plus")
                        .foregroundColor(isActive ? Color("SecondaryColor") : .black)
                }
            }
        }
    }
}

struct AllWords_Previews: PreviewProvider {
    static var previews: some View {
        AllWords()
    }
}

