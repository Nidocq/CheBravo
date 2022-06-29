//
//  AllWords.swift
//  Chebravo
//
//  Created by Phillip Lundin on 26/06/2022.
//

import SwiftUI

struct AllWords: View {
    @Environment(\.managedObjectContext) var viewContext
    @State var input : String = "Type in a word ..."
    var wordController = WordController()
    
    @FetchRequest(sortDescriptors: []) var words: FetchedResults<Word>
    
    @State var isActive = true
    var body: some View {
        NavigationView {
            ZStack {
                Color("PrimaryColor")
                    .ignoresSafeArea()
                
                VStack {
                    InputField(input: $input, wordController: wordController)
                    ScrollView {
                        
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
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct InputField : View {
    @Environment(\.managedObjectContext) var viewContext

    @Binding var input : String
    var wordController : WordController
    let cornerRadiusAmount : CGFloat = 10
    let paddingTopBottom : CGFloat = 30
    var body: some View {
        VStack {
            
            //TODO: Watch a Video on textfields to remove the prewritten text when pressing it
            // Requirement:
            // * Text needs to be removed when
            // * The Typing needs to go down
            // (* go to the view to see a preview)
            TextField("Input a word", text: $input) {
                AddWord()
            }
            .foregroundColor(.black)
            .frame(maxWidth: .infinity)
            .padding()
            .background(.white)
            .cornerRadius(cornerRadiusAmount)
            .padding(.top, paddingTopBottom)
            Button() {
                wordController.addItem(viewContext: viewContext, Wordname: input)
                input = ""
            } label: {
                Text("ADD WORD")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color("SecondaryColor"))
                    .cornerRadius(cornerRadiusAmount)
                    .foregroundColor(.black)
            }
        }
        .padding([.leading, .trailing], 10)
        .padding(.bottom, paddingTopBottom)
    }
}

struct AllWords_Previews: PreviewProvider {
    static var previews: some View {
        AllWords()
    }
}

