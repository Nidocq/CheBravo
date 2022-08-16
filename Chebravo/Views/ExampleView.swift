//
//  YourExamples.swift
//  Chebravo
//
//  Created by Phillip Lundin on 22/07/2022.
//

import SwiftUI

/// <summary> Here are the examples that the user will have
/// acquired throughout their learning, showcased nicely </summary>
struct ExampleView: View {
    @State var textInput : String = ""
    @FocusState private var emailFieldIsFocused: Bool

    var body: some View {
        ZStack {
            Color("PrimaryColor")
                .ignoresSafeArea()
            
            VStack {
                TextField(
                    "Type in an example that should be translated",
                    text: $textInput
                )
                .focused($emailFieldIsFocused)
                .textInputAutocapitalization(.never)
                .disableAutocorrection(true)
                .border(.secondary)
                
                Text(textInput)
                        .foregroundColor(emailFieldIsFocused ? .red : .blue)
            }

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct YourExamples_Previews: PreviewProvider {
    static var previews: some View {
        ExampleView()
    }
}
