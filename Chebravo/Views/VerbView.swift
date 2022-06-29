//
//  Verb.swift
//  Chebravo
//
//  Created by Phillip Lundin on 26/06/2022.
//



import SwiftUI

struct VerbView: View {
    @Environment(\.presentationMode) var presentationMode
    var word : Word
    
    init(word: Word) {
        self.word = word
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.backgroundColor = .white
        navBarAppearance.shadowColor = .clear
        UINavigationBar.appearance().standardAppearance = navBarAppearance
        UINavigationBar.appearance().compactAppearance = navBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
        UINavigationBar.appearance().tintColor = .blue
        
    }
    
    
    
    // TODO: Add a date so the coredata can sort by date (Prefferably by default)
    var body: some View {
        ZStack {
            Color("PrimaryColor")
                .ignoresSafeArea()
            
            // All Components
            ScrollView {
                
                // White box with word and translation
                VStack {
//                    SubTitle(name: "Translation")
                    
                    // Word and translation
                    VStack(alignment: .leading) {
                        TranslationOfWord(
                            Name: self.word.name ?? "Unkown",
                            WordType: WordType.verb.rawValue,
                            ConjugationProcess: ConjugationProcess.second.rawValue

                        )
                    }
                        .padding([.leading, .trailing], 40)
                        .padding([.top, .bottom], 16)
                    
                    
                }
                .frame(maxWidth: .infinity)
                .padding([.top, .bottom], 10)
                .background(.white)
                
                
                // Example of word
                // TODO: Make several examples pop-up with this.name
                VStack {
                    SubTitle(name: "Example")
                    ExampleTranslation()
                   
                }
                .frame(maxWidth: .infinity)
                
                
                // Groups
                VStack {
                    SubTitle(name: "Conjugation")
                    
                }
                
                // Tenses
                VStack {
                    SubTitle(name: "Tenses")
                }
                Spacer()
                
                DeleteButton(word: self.word)
            }
            .frame(maxWidth: .infinity)
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                HStack {
                    Image(systemName: "chevron.backward")
                    Button("Back") {
                        presentationMode.wrappedValue.dismiss()
                        print("I was pressed")
                    }
                }
                .foregroundColor(Color("SecondaryColor"))
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    print("I have a question")
                } label: {
                    Image(systemName: "questionmark.circle")
                        .foregroundColor(Color("SecondaryColor"))
                    
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(false)
        .navigationTitle("")
        
        //TODO: BUG: When swiping up, the background color can be seen if navigationBarTitleDisplayMode(.inline) is set. If there IS a title
        // the color of the title goes all the way up and no background color can be seen.
//        .navigationBarTitleDisplayMode(.inline)
        
    }
}




// MARK: COMPONENTS

struct SubTitle: View {
    var name : String
    var body: some View {
        Text(self.name)
            .font(.system(size: 20))
            .foregroundColor(Color("SecondaryColor"))
            .bold()
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading)
            .padding(.top, 10)
    }
}


struct WordName: View {
    var name: String
    var body: some View {
        Text(self.name)
            .font(.system(size: 24))
    }
}

/// Used to describe the classes and attributes of the word
/// e.g. if it is a verb, irregular or regular conjugated
struct WordSpecification: View {
    var text: String
    var body: some View {
        Text(text)
            .opacity(0.5)
            .font(.system(size: 11))
    }
}

struct ExampleTranslation: View {
    // TODO: Create some translation manager that can translate quotes
    var body: some View {
        VStack {
            Group {
                Text("This is some text")
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("This is translation text")
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
            .padding([.trailing, .leading], 40)
            .padding([.top, .bottom], 10)
            .foregroundColor(.white)
            
        }
    }
}

struct DeleteButton: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.managedObjectContext) var viewContext
    var wordController = WordController()
    var word : Word

    var body: some View {
        
        Button {
            presentationMode.wrappedValue.dismiss()
            wordController.removeItem(viewContext: viewContext, word: word)
            
        } label : {
            Text("Delete word")
                .foregroundColor(.black)
                .padding()
                .background(Color("SecondaryColor"))
                .cornerRadius(22)
                .frame(maxWidth: 300)
        }
    }
}


//MARK: PREVIEW
//struct VerbView_Previews: PreviewProvider {
//    static var previews: some View {
//        VerbView(word: wor)
//    }
//}
