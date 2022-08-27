//
//  TutorialView.swift
//  Chebravo
//
//  Created by Phillip Lundin on 22/07/2022.
//

import SwiftUI

/// <summary> Show the user how to use this app briefly, if they click on the icon
/// that invokes this view. It is found in the AllWords.swift </summary>
struct TutorialView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack {
            Color("PrimaryColor")
                .ignoresSafeArea()
            
            VStack {
                VStack {
                    InfoGraph(
                        symbol: "graduationcap.fill",
                        header: "Learning",
                        text: "Essential modules are found here in order to teach you the most important basics of Italian."
                    )
                    InfoGraph(
                        symbol: "books.vertical.fill",
                        header: "Words",
                        text: "The words you have discovered will be located here."
                    )
                    InfoGraph(
                        symbol: "quote.bubble.fill",
                        header: "Examples",
                        text: "Examples you have encountered will be located here as well as a translatoin for each example.")
                    InfoGraph( // Do we even need this one?
                        symbol: "gearshape.fill",
                        header: "Settings",
                        text: "Configure and find information about the application here."
                    )
                }
                    Button {
                        dismiss()
                    } label: {
                        Text("Okay")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .foregroundColor(Color("PrimaryColor"))
                            .background(Color("SecondaryColor"))
                            
                    }
                    .cornerRadius(18)
            }
                    .padding(10)
            
        }
    }
}

struct InfoGraph : View {
    var symbol : String
    var header : String
    var text : String
    let paddingLeftRight : CGFloat = 30
    var body: some View {
        VStack { // Infographic
            HStack { // Icon with text
                    Image(systemName: symbol) .frame(width: 50, height: 50)
                        .font(.system(size: 44))
                        .padding(.trailing, 10)
                VStack(alignment: .leading, spacing: 8) { // Title and text
                    Text(header)
                        .font(.system(size: 30))
                        .foregroundColor(Color("SecondaryColor"))
                    Rectangle()
                        .frame(height: 2)
                        .foregroundColor(Color("SecondaryColor"))
                    Text(text)
                        .foregroundColor(Color("SecondaryColor"))
                        .fixedSize(horizontal: false, vertical: true)
                        
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding([.leading, .trailing], paddingLeftRight)
        }
            .foregroundColor(Color("SecondaryColor"))
    }
}

struct TutorialView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialView()
    }
}
