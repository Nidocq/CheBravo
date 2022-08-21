//
//  AddNewExampleView.swift
//  Chebravo
//
//  Created by Phillip Lundin on 21/08/2022.
//

import SwiftUI

struct AddNewExampleView: View {
    @State var textInput : String = ""
    @FocusState private var emailFieldIsFocused: Bool
    
    var body: some View {
        ZStack {
            Color("PrimaryColor")
                .ignoresSafeArea()
            
            VStack {
                TextField(
                    // TODO: Make the text be there with userDefaults, even though the user exists the view to save progress
                    "Type in an example that should be translated",
                    text: $textInput
                )
                .frame(height: 50)
                .focused($emailFieldIsFocused)
                .textInputAutocapitalization(.never)
                .disableAutocorrection(true)
                .border(.secondary)
                .padding()
                
                Text(textInput)
                        .foregroundColor(emailFieldIsFocused ? .red : .blue)
                        .font(.system(size: 24))
            }

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct AddNewExampleView_Previews: PreviewProvider {
    static var previews: some View {
        AddNewExampleView()
    }
}
