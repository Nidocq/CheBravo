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
    
    @Environment(\.managedObjectContext) var viewContext

    @FetchRequest(sortDescriptors: []) var words: FetchedResults<Word>
    
    
    // TODO: MOVE THIS **** OUT OF THIS CLASS!
    func addItem() {
        withAnimation {
            let newWord = Word(context: viewContext)
            newWord.name = "Hello there"
            try? viewContext.save()
        }
    }
    
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
                    addItem()
                    
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

