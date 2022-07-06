//
//  Verb.swift
//  Chebravo
//
//  Created by Phillip Lundin on 26/06/2022.
//



import SwiftUI

/// <summary> Displays information about the Verb that the user has saved </summary>

// TODO: Make it able to swipe back in view so you don't have to press back all the time
struct VerbView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var isSheetPresent : Bool = false
    @ObservedObject var word : Word
    
    init(word: Word) {
        // In order to syle the NavigationBar background color
        self.word = word
//        let navBarAppearance = UINavigationBarAppearance()
//        navBarAppearance.backgroundColor = .white
//        navBarAppearance.shadowColor = .clear
//        UINavigationBar.appearance().standardAppearance = navBarAppearance
//        UINavigationBar.appearance().compactAppearance = navBarAppearance
//        UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
//        UINavigationBar.appearance().tintColor = .blue
        
    }
    
    
    
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
                        TranslationOfWord(word: word)
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
            }
            .frame(maxWidth: .infinity)
        }
        .toolbar {
            // Toolbar back button
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    presentationMode.wrappedValue.dismiss()
                    print("I was pressed")
                } label: {
                    HStack {
                        Image(systemName: "chevron.backward")
                        Text("Back")
                    }
                    .foregroundColor(Color("SecondaryColor"))
                }
            }
            // Toolbar settings popup
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    isSheetPresent = true
                } label: {
                    Image(systemName: "gearshape.fill")
                        .foregroundColor(Color("SecondaryColor"))
                    
                }
                .sheet(isPresented: $isSheetPresent) {
                    VerbViewSettings(word: word)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(false)
        .navigationTitle("")
        .navigationBarTitleDisplayMode(.inline)
        
        
    }
}




// MARK: COMPONENTS
/// <summary> Titles that descripe the information </summary>
/// <param arg="name"> Text of title </param>
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

/// <summary> Gives a translates with the word as example <summary>
/// <remarks> Not yet implemented </remarks>
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

/// <summary> Deletes the current word from the CoreData database when the user clicks on it </summary>
/// <param name="word"> The specified word that needs to be deleted from the CoreData database </param>
struct DeleteButton: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.managedObjectContext) var viewContext
    var wordController = WordController()
    @ObservedObject var word : Word

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
