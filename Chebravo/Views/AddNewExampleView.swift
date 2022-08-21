//
//  AddNewExampleView.swift
//  Chebravo
//
//  Created by Phillip Lundin on 21/08/2022.
//

import SwiftUI

struct AddNewExampleView: View {
    let CC = ContextController()
    
    @Environment(\.dismiss) var dismiss
    @Environment(\.managedObjectContext) var viewContext
    
    @State var headingText : String = ""
    @State var bodyText : String = ""
    @FocusState private var emailFieldIsFocused: Bool
    
    let paddingOnSides : CGFloat = 20
    let paddingInsideTextFields : CGFloat = 15
        
    var body: some View {
        ZStack {
            Color("PrimaryColor")
                .ignoresSafeArea()
            
            VStack(alignment: .leading) {
                Text("Add an example")
                    .bold()
                    .font(.system(size: 24))
                    .foregroundColor(Color("SecondaryColor"))
                    .padding(.bottom, 10)
                Text("Adding a little header for your example will help you to remember the context and example translation better")
                    .foregroundColor(Color("SecondaryColor"))
                VStack {
                    TextField(
                        // TODO: Make the text be there with userDefaults, even though the user exists the view to save progress
                        // TODO: Make text more readible with default value colors
                        "Heading",
                        text: $headingText
                    )
                    .foregroundColor(Color("SecondaryColor"))
                    .frame(height: 30)
                    .focused($emailFieldIsFocused)
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
                    .font(.system(size: 24))
                    .padding(paddingInsideTextFields)
                    .border(Color("SecondaryColor"))
                    
                    TextField(
                        "Example to be translated...",
                        text: $bodyText
                    )
                    .foregroundColor(Color("SecondaryColor"))
                    .frame(height: 100)
                    .focused($emailFieldIsFocused)
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
                    .padding(paddingInsideTextFields)
                    .fixedSize(horizontal: false, vertical: true)
                }
                    .border(Color("SecondaryColor"))
                
                // Add example button
                Button {
                    Task {
                        do {
                            await CC.addExample(
                                viewContext: viewContext,
                                ExampleText: bodyText,
                                note: headingText
                            )
                            
                        }
                    }
                    
                    dismiss()
                    
                } label: {
                    Text("Add Example")
                        .frame(width: UIScreen.main.bounds.width-paddingOnSides*2, height: 50)
                        .background(Color("SecondaryColor"))
                        .foregroundColor(Color("PrimaryColor"))
                        .padding(.top, 30)
                }
                
                // Cancel button
                Button {
                    dismiss()
                    
                } label: {
                    Text("Cancel")
                        .frame(width: UIScreen.main.bounds.width-paddingOnSides*2, height: 50)
                        .background(Color("SecondaryColor"))
                        .foregroundColor(Color("PrimaryColor"))
                        .padding(.top, 30)
                }
                
                
                // TODO: Make a live example (with a live creation of the component)
                // ExampleCard($headingText, $bodyText)
            }
            .padding([.leading, .trailing], paddingOnSides)

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .navigationTitle("Add Example")
    }
}

struct AddNewExampleView_Previews: PreviewProvider {
    static var previews: some View {
        AddNewExampleView()
    }
}
