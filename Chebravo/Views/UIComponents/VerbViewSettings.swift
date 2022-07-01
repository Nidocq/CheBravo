//
//  VerbViewSettings.swift
//  Chebravo
//
//  Created by Phillip Lundin on 01/07/2022.
//

import SwiftUI

/// <summary> Settings view that displays common settings and information of a word </summary>
struct VerbViewSettings: View {
    @Environment(\.dismiss) var dismiss
    var word : Word
    
    var body: some View {
        ZStack {
            Color("PrimaryColor")
                .ignoresSafeArea()
            
            VStack {
                Text(word.name ?? "Unkown name")
                Text(word.date ?? Date(timeIntervalSinceReferenceDate: 0), style: .date)
                // TODO: Make an alert that prompts the user if they are sure they want to delete the word
                Button {
                   dismiss()
                } label: {
                    DeleteButton(word: word)
                    
                }
                
                Button {
                    dismiss()
                } label: {
                    Text("Go back")
                    .background(Color("SecondaryColor"))
                    .frame(maxWidth: .infinity, maxHeight: 42)
                    .padding()
                    

                }
            }
        }
    }
}

//struct VerbViewSettings_Previews: PreviewProvider {
//    static var previews: some View {
//        VerbViewSettings()
//    }
//}
