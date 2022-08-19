//
//  TutorialView.swift
//  Chebravo
//
//  Created by Phillip Lundin on 22/07/2022.
//

import SwiftUI
//TODO: Make the tutorial for how to use the application

/// <summary> Show the user how to use this app briefly, if they click on the icon
/// that invokes this view. It is found in the AllWords.swift </summary>
struct TutorialView: View {
    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            Image(systemName: "graduationcap.fill") // learn
            Image(systemName: "book.fill") // All words
            Image(systemName: "ear.fill") // examples
            
            Button {
                Task {
                    do {
                        print("\(await TranslationController().translateText(text: "mi piache $100 gilato"))")
                    }
                }
            } label: {
                Text("Test API")
                    .foregroundColor(.white)
                    .frame(width: 300, height: 100)
                    .background(.black)
            }
        }
    }
}

struct TutorialView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialView()
    }
}
