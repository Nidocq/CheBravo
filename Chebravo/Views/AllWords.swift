//
//  AllWords.swift
//  Chebravo
//
//  Created by Phillip Lundin on 26/06/2022.
//

import SwiftUI

// TODO: Make the Darkmode more friendly with colors that are darker than white :(((
// TODO: If and when someone types in a space, make a popup that says, "Only words are enabled in this view, head to examples to cover your own examples lorum"
// TODO: Swiping words can remove them

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
        SortDescriptor(\.date, order: .reverse)
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
                    
                    // Translation or Compact
                    ViewSelection(
                        selectedViewOption: $selectedViewOption,
                        paddingLeadingTrailing: paddingLeadingTrailing
                    )
                    
                    // based on ViewSelection, how should words be displayed
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

/// <summary> The input field where the user can type in the
/// desired word to be translated </summary>
/// <param name="input">The input that needs to be translated</param>
/// <param name="wordController">Uses the controller to tranlsate the desired word </param>
/// <param name="paddingLeadingTrailing">spacing for left and right screen </param>
/// <param name="cornerRadiusAmount">corner radius amount of the input field</param>
/// <param name="paddingTopBottom">the padding on top and bottom </param>
struct InputField : View {
    @Environment(\.managedObjectContext) var viewContext
    @Binding var input : String
    @FocusState private var inputFocused : Bool
    
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

/// <summary> View selection of how the words should be displayed
/// Translation | normal showcase
/// Compact | compact, translation is not present, more squeezed </summary>
/// <param name="selectedViewOption"> enum of the ViewOptions </param>
/// <param name="paddingLeadingTrailing"> spacing for left and right screen </param>
struct ViewSelection : View {
    @Binding var selectedViewOption : ViewOptions
    
    // TODO: Styling the ViewPicker
    let paddingLeadingTrailing: CGFloat
    var body: some View {
        Picker("View Options", selection: $selectedViewOption) {
            ForEach(ViewOptions.allCases, id:\.self) { ViewOpt in
                Text(ViewOpt.rawValue)
            }
        }
            .pickerStyle(.segmented)
            .padding([.leading, .trailing], paddingLeadingTrailing)
            .padding(.bottom, 14)
    }
}

/// <summary> Non-compact version of showcasing words,
/// Uses WordDisplay with a translated word </summary>
/// <param name="words"> words fetched from a/the database </param>
/// <param name="paddingLeadingTrailing">space on left and right </param>
struct TranslatedViewOption : View {
    var words : FetchedResults<Word>
    let paddingLeadingTrailing : CGFloat
    
    var body: some View {
        ScrollView {
            ForEach(words, id: \.self) { word in
                // TODO: Searching for a word so that only the words matching the strign
                // serached for, will show up. Update real time
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

/// <summary> Uses the WordDisplay component with compact ViewOption
/// to display words compactly and uses gridItems to get them aligned </summary>
/// <param name="paddingLeadingTrailing">space on left and right </param>
/// <param name="words"> words fetched from a/the database </param>
struct CompactViewOption : View {
    let paddingLeadingTrailing : CGFloat
    let GridItemSpacing : CGFloat = 114
    var words : FetchedResults<Word>
    
    var columns : [GridItem] {
        // Computed properties https://developer.apple.com/forums/thread/84827
        // Is to prevent magic number of 114
        get {
            return [
                // Size of the width of the word in WordComponent - case .translation:
                GridItem(.adaptive(minimum: GridItemSpacing))
            ]
        }
    }
    
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
