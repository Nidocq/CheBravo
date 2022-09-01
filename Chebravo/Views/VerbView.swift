//
//  Verb.swift
//  Chebravo
//
//  Created by Phillip Lundin on 26/06/2022.
//



import SwiftUI

/// <summary> Displays information about the Verb that the user has saved </summary>
/// <remarks> This libaray will be useful for making connections
/// https://github.com/ian-hamlin/verb-data/tree/master/json/italian </remarks>
struct VerbView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var isSheetPresent : Bool = false
    @ObservedObject var word : Word
    
    init(word: Word) {
        // In order to syle the NavigationBar background color
        self.word = word
        let navBarAppearance = UINavigationBar.appearance()
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor(Color("SecondaryColor"))]
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor(Color("SecondaryColor"))]
        
    }
    
    var body: some View {
        ZStack {
            Color("PrimaryColor")
                .ignoresSafeArea()
            
            // All Components
            VStack {
                
                // White box with word and translation
                VStack {
//                    SubTitle(name: "Translation")
                    
                    // Word and translation
                    VStack(alignment: .leading) {
                        WordDisplay(word: word, ViewOptionType: ViewOptions.translation)
                    }
                        .padding([.leading, .trailing], 40)
                        .padding([.top, .bottom], 16)
                    
                    
                }
                .frame(maxWidth: .infinity)
                .padding([.top, .bottom], 10)
                .background(.white)
                
                
                // Example of word
                // TODO: Make several examples pop-up with this.name
                ScrollView {
                        
                    // Groups
                    VStack {
                        SubTitle(name: "Conjugation")
                        
                    }
                    
                    // Tenses
                    VStack {
                        SubTitle(name: "Tenses")
                    }
                    
                    VStack {
                        SubTitle(name: "Example")
                        ExampleTranslation()
                       
                    }
                    .frame(maxWidth: .infinity)
                    
                    Spacer()
                }
                .frame(maxWidth: .infinity)
            }
        }
        .toolbar {
            // Toolbar back button
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    presentationMode.wrappedValue.dismiss()
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




//MARK: PREVIEW
//struct VerbView_Previews: PreviewProvider {
//    static var previews: some View {
//        VerbView(word: wor)
//    }
//}
