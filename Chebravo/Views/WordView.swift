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
struct WordView: View {
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
                        
//                    // Groups
//                    VStack {
//                        SubTitle(ICON_NAME: "table", name: "Conjugation")
//
//                    }
//
//                    // Tenses
//                    VStack {
//                        SubTitle(ICON_NAME: "clock", name: "Tenses")
//                    }
                    
                    VStack {
                        SubTitle(ICON_NAME: "eye.square", name: "From Your Examples")
                        ExampleTranslation(word: word)
                       
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
    let ICON_NAME : String
    var name : String
    let leadingPadding : CGFloat = 12
    var body: some View {
        VStack {
            HStack(spacing: 18) {
                Image(systemName: self.ICON_NAME)
                    .frame(maxWidth: 30, alignment: .center)
                Text(self.name)
                    .bold()
            }
                    .font(.system(size: 26))
                    .foregroundColor(Color("SecondaryColor"))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, self.leadingPadding)
                    .padding(.top, 10)
            Seperator()
                // To match the start of the title
                .offset(x:-self.leadingPadding-4)
                .padding(.bottom, 18)
        }
                    .frame(maxWidth: .infinity, alignment: .leading)
    }
}

/// <summary> Gives a translates with the word as example <summary>
/// <remarks> Not yet implemented </remarks>
struct ExampleTranslation: View {
    let word : Word
    let CC : ContextController = ContextController()
    let leadingPadding : CGFloat = 30
    @Environment(\.managedObjectContext) var viewContext

    @FetchRequest(sortDescriptors: [])
    var allExamples : FetchedResults<Example>
    
    @State var matchingWords : [Example] = []
    
    
    var body: some View {
        if self.matchingWords.count == 0 {
            //TODO: Add a page that tells you if you have an example where a
            // word is in them, they will show up here. (Other way around)
            
            // Basically made an infographic that tells the user to words that
            // match to find them here
            Text("None - Your examples will show up here of your matching words")
                .foregroundColor(Color("SecondaryColor"))
                .fixedSize(horizontal: false, vertical: true)
        }
        VStack(alignment: .leading) {
            ForEach(self.matchingWords) { matchEx in
                NavigationLink(destination: ExampleView(example: matchEx)) {
                Text(matchEx.context ?? "None")
                    .font(.system(size: 20))
                    .padding(.leading, self.leadingPadding)
                    .padding(.bottom, 10)
                }
            }
            .foregroundColor(Color("SecondaryColor"))
        }
        // TODO: Make another VStack to print out the translated quotes.
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.65) {
                withAnimation(.spring()) {
                    self.matchingWords = CC.wordMatchExample(
                        word: word,
                        allExamples: allExamples)
                }
            }
        }
        .onChange(of: self.matchingWords) { _ in
            withAnimation(.spring()) {
                self.matchingWords = CC.wordMatchExample(
                    word: word,
                    allExamples: allExamples)
            }
        }
    }
}




//MARK: PREVIEW
//struct VerbView_Previews: PreviewProvider {
//    static var previews: some View {
//        VerbView(word: wor)
//    }
//}
