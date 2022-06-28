//
//  AllWords.swift
//  Chebravo
//
//  Created by Phillip Lundin on 26/06/2022.
//

import SwiftUI

struct AllWords: View {
//    @State var words : [String] = ["Mangiare", "Sapere", "Avere"]
    
//    @StateObject var WordCon = WordController()
    
    @Environment(\.managedObjectContext) var modelContainer
    @FetchRequest(sortDescriptors: []) var words: FetchedResults<Word>
    
    @State var isActive = true
    var body: some View {
        NavigationView {
            ZStack {
                Color("PrimaryColor")
                    .ignoresSafeArea()
                ScrollView {
                    ForEach(words, id: \.self) { word in
                        NavigationLink(
                            destination:
                                // When clicked go to Verb View
                                Verb(Name: word.name ?? "Unkown",
                                     WordType: "adj.",
                                     ConjugationProcess: "re.")
                        ) {
                            // Style of the navigation link
                            TranslationOfWord(Name: word.name ?? ";)", WordType: "Verb.", ConjugationProcess: "re.")
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
                    var newWord = Word(context: modelContainer)
                    try? modelContainer.save()
                    
                    
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

// MARK: COMPONENTS
