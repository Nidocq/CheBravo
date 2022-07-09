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
                    
                    ViewOption(
                        selectedViewOption: $selectedViewOption,
                        paddingLeadingTrailing: paddingLeadingTrailing
                    )
                    
                    switch selectedViewOption {
                    case ViewOptions.translation:
                        Text("Translation")
                    case ViewOptions.compact:
                        Text("Compact")
                    default:
                        Text("Default")

                    }
                    
//                    ScrollView {
//                        ForEach(words, id: \.self) { word in
//                            NavigationLink(
//                                destination:
//                                    // When clicked go to Verb View
//                                VerbView(word: word)
//                            ) {
//                                // Style of the navigation link
//                                TranslationOfWord(word: word)
//                                .padding()
//                                .background(.white)
//                                .cornerRadius(10)
//                                .padding([.leading, .trailing], paddingLeadingTrailing)
//                                .foregroundColor(.black)
//                            }
//                        }
//                    }
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
            //TODO: Make the tutorial for how to use the application
            Text("Hello")
        }

    }
}

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
        }
        .padding([.leading, .trailing], paddingLeadingTrailing)
        .padding([.bottom, .top], paddingTopBottom)
    }
}

struct ViewOption : View {
    
    @Binding var selectedViewOption : ViewOptions
    var paddingLeadingTrailing: CGFloat
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

struct AllWords_Previews: PreviewProvider {
    static var previews: some View {
        AllWords()
    }
}

// MARK: FUNCTIONS

