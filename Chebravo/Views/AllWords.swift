//
//  AllWords.swift
//  Chebravo
//
//  Created by Phillip Lundin on 26/06/2022.
//

import SwiftUI

/// <summary> Showcases all the Words the user has saved so far, Data is saved with CoreData </summary>
struct AllWords: View {
    @Environment(\.managedObjectContext) var viewContext
    @State var input : String = ""
    let paddingLeadingTrailing : CGFloat = 18
    var wordController = WordController()
    
    // TODO: Add a date so the coredata can sort by date (Prefferably by default)
    @FetchRequest(sortDescriptors: [
        SortDescriptor(\.date)
    ]) var words: FetchedResults<Word>
    
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
                                .padding([.leading, .trailing], paddingLeadingTrailing)
                                .foregroundColor(.black)
                            }
                        }
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        // TODO: Make the button explain how to use the app
                        print("Need help")
                    } label : {
                        Image(systemName: "questionmark.circle")
                            .foregroundColor(Color("SecondaryColor"))
                    }
          
                }
            
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("CheBravo")
                .foregroundColor(Color("SecondaryColor"))
        }
    }
}

struct InputField : View {
    @Environment(\.managedObjectContext) var viewContext
    @Binding var input : String
    @FocusState private var inputFocused : Bool
    
    var wordController : WordController
    let paddingLeadingTrailing : CGFloat = 18
    let cornerRadiusAmount : CGFloat = 10
    let paddingTopBottom : CGFloat = 22
    var body: some View {
        VStack {
            
            //TODO: Watch a Video on textfields to remove the prewritten text when pressing it
            // Requirement:
            // * The Typing needs to go down
            // (* go to the view to see a preview)
            // BUG: the background doesn't work for TextField. Make Rect with a textfield on top of it
            TextField("Type in a word ...", text: $input)
                .disableAutocorrection(true)
                .frame(maxWidth: .infinity, maxHeight: 24)
                .padding()
                .background(.white)
                .cornerRadius(cornerRadiusAmount)
                .foregroundColor(.black)
                .focused($inputFocused)
            Button() {
                wordController.addItem(viewContext: viewContext, Wordname: input)
                input = ""
                inputFocused = false 
            } label: {
                Text("ADD WORD")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color("SecondaryColor"))
                    .cornerRadius(cornerRadiusAmount)
                    .foregroundColor(.black)
            }
        }
        .padding([.leading, .trailing], paddingLeadingTrailing)
        .padding([.bottom, .top], paddingTopBottom)
    }
}

struct AllWords_Previews: PreviewProvider {
    static var previews: some View {
        AllWords()
    }
}

