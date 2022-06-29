//
//  AllWords.swift
//  Chebravo
//
//  Created by Phillip Lundin on 26/06/2022.
//

import SwiftUI

struct AllWords: View {
    @Environment(\.managedObjectContext) var viewContext
    @State var input : String = "Hello there "
    var wordController = WordController()
    


    @FetchRequest(sortDescriptors: []) var words: FetchedResults<Word>
    
    @State var isActive = true
    var body: some View {
        NavigationView {
            ZStack {
                Color("PrimaryColor")
                    .ignoresSafeArea()
                ScrollView {
                    // TODO: Make this into struct and style it
                    TextField("Hello ", text: $input) {
                        print("I saved")
                    }
                    
                    
                    ForEach(words, id: \.self) { word in
                        NavigationLink(
                            destination:
                                // When clicked go to Verb View
                            VerbView(word: word)
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
                    wordController.addItem(viewContext: viewContext)
                    
                } label: {
                    Image(systemName: "plus")
                        .foregroundColor(isActive ? Color("SecondaryColor") : .black)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct AllWords_Previews: PreviewProvider {
    static var previews: some View {
        AllWords()
    }
}

