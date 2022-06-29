//
//  AllWords.swift
//  Chebravo
//
//  Created by Phillip Lundin on 26/06/2022.
//

import SwiftUI

struct AllWords: View {
    @Environment(\.managedObjectContext) var viewContext
    var wordController = WordController()
    
//    init() {
//        self.wordController = WordController()
//
//    }

    @FetchRequest(sortDescriptors: []) var words: FetchedResults<Word>
    
    @State var isActive = true
    var body: some View {
        NavigationView {
            ZStack {
                Color("PrimaryColor")
                    .ignoresSafeArea()
                ScrollView {
                    ForEach(words, id: \.self) { word in
                        Text(word.name ?? "Not Found")
//                        NavigationLink(
//                            destination:
//                                // When clicked go to Verb View
//                            VerbView(word: Word)
//                        ) {
//                            // Style of the navigation link
//                            TranslationOfWord(Name: word.name ?? ";)", WordType: "Verb.", ConjugationProcess: "re.")
//                            .padding()
//                            .background(.white)
//                            .cornerRadius(10)
//                            .padding([.leading, .trailing], 10)
//                            .foregroundColor(.black)
//                        }
                    }
                }
            }
            .toolbar {
                Button {
                    // TODO: Make the button add a new word
                    withAnimation {
                        isActive.toggle()
                    }
                    wordController.addItem(viewContext: viewContext)
                    
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

