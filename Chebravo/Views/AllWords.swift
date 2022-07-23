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
    @State private var IsHelpSheetActive = false
    @State var selectedViewOption : ViewOptions = ViewOptions.translation
    
    
    let paddingLeadingTrailing : CGFloat = 18
    let cornerRadiusAmount : CGFloat = 10
    let paddingTopBottom : CGFloat = 14
    var wordController = WordController()
    
    init() {
        let navBarAppearance = UINavigationBar.appearance()
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor(Color("SecondaryColor"))]
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor(Color("SecondaryColor"))]
    }
    
    @FetchRequest(sortDescriptors: [
        SortDescriptor(\.date)
    ]) var words: FetchedResults<Word>
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("PrimaryColor")
                    .ignoresSafeArea()
                
                VStack {
                    InputField(
                        input: $input,
                        wordController: wordController,
                        paddingLeadingTrailing: paddingLeadingTrailing,
                        cornerRadiusAmount: cornerRadiusAmount,
                        paddingTopBottom: cornerRadiusAmount
                    )
                    
                    ViewSelection(
                        selectedViewOption: $selectedViewOption,
                        paddingLeadingTrailing: paddingLeadingTrailing
                    )
                    
                    switch selectedViewOption {
                        case ViewOptions.translation:
                            TranslatedViewOption(words: words, paddingLeadingTrailing: paddingLeadingTrailing)
                        case ViewOptions.compact:
                            CompactViewOption(paddingLeadingTrailing: paddingLeadingTrailing, words: words)
                    }
                    

                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        IsHelpSheetActive = true
                        
                    } label : {
                        Image(systemName: "questionmark.circle")
                            .foregroundColor(Color("SecondaryColor"))
                    }
          
                }
            
            }
            .navigationBarTitleDisplayMode(.large)
            .navigationTitle("CheBravo")
                .foregroundColor(Color("SecondaryColor"))
        }
        .sheet(isPresented: $IsHelpSheetActive) {
            TutorialView()
        }

    }
}

struct InputField : View {
    @Environment(\.managedObjectContext) var viewContext
    @Binding var input : String
    @FocusState private var inputFocused : Bool
    var Haptic = UINotificationFeedbackGenerator()
    
    var wordController : WordController
    let paddingLeadingTrailing : CGFloat
    let cornerRadiusAmount : CGFloat
    let paddingTopBottom : CGFloat
        
    func AddNewWord() async {
        await wordController.addItem(viewContext: viewContext, Wordname: input)
        input = ""
        inputFocused = false
    }

    var body: some View {
        VStack {
            
            // Requirement:
            // (* go to the view to see a preview)
            TextField("Type in a word ...", text: $input)
                .disableAutocorrection(true)
                .frame(maxWidth: .infinity, maxHeight: 24)
                .padding()
                .background(.white)
                .cornerRadius(cornerRadiusAmount)
                .foregroundColor(.black)
                .focused($inputFocused)
                .onChange(of: input) { newValue in
                    input = input.replacingOccurrences(of: " ", with: "")
                }
            
            Button() {
                Task {
                    Haptic.notificationOccurred(.success)
                    do {
                        await AddNewWord()
                    }
                }
            } label: {
                Text("ADD WORD")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color("SecondaryColor"))
                    .cornerRadius(cornerRadiusAmount)
                    .foregroundColor(.black)
            }
            // TODO: Add disabling to the button when it is loading
            // .disabled(true)
        }
        .padding([.leading, .trailing], paddingLeadingTrailing)
        .padding([.bottom, .top], paddingTopBottom)
    }
}

struct ViewSelection : View {
    @Binding var selectedViewOption : ViewOptions
    
    // TODO: Styling the ViewPicker
    let paddingLeadingTrailing: CGFloat
    var body: some View {
        Picker("View Options", selection: $selectedViewOption) {
            ForEach(ViewOptions.allCases, id:\.self) { opt in
                Text(opt.rawValue)
            }
        }
            .pickerStyle(.segmented)
            .padding([.leading, .trailing], paddingLeadingTrailing)
            .padding(.bottom, 14)
    }
}

struct TranslatedViewOption : View {
    var words : FetchedResults<Word>
    let paddingLeadingTrailing : CGFloat
    
    var body: some View {
        ScrollView {
            ForEach(words, id: \.self) { word in
                NavigationLink(
                    destination:
                    // When clicked go to Verb View
                        VerbView(word: word)
                ) {
                    // Style of the navigation link
                    WordDisplay(word: word, ViewOptionType: ViewOptions.translation)
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


struct CompactViewOption : View {
    let paddingLeadingTrailing : CGFloat
    var words : FetchedResults<Word>
    
    let columns : [GridItem] = [
        // Size of the width of the word in WordComponent - case .translation:
        GridItem(.adaptive(minimum: 114))
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(words, id: \.self) { word in
                    NavigationLink(
                        destination:
                        // When clicked go to Verb View
                            VerbView(word: word)
                    ) {
                        // Style of the navigation link
                        WordDisplay(word: word, ViewOptionType: .compact)
                            .padding()
                            .background(.white)
                            .cornerRadius(10)
                            .padding([.leading, .trailing], paddingLeadingTrailing)
                            .foregroundColor(.black)
                    }
                }
                    
            }
                .padding([.leading, .trailing], paddingLeadingTrailing)
        }
    }
}


struct AllWords_Previews: PreviewProvider {
    static var previews: some View {
        AllWords()
    }
}

// MARK: FUNCTIONS

