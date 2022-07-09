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
    @ObservedObject var word : Word
    
    var body: some View {
        ZStack {
            Color("PrimaryColor")
                .ignoresSafeArea()
            
            VStack {
                Text(word.name ?? "Unkown name")
                    .font(.system(size: 44))
                Text(word.date ?? Date(timeIntervalSinceReferenceDate: 0), style: .date)
                    .font(.system(size: 24))
                    .foregroundColor(.gray)
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

/// <summary> Deletes the current word from the CoreData database when the user clicks on it </summary>
/// <param name="word"> The specified word that needs to be deleted from the CoreData database </param>
struct DeleteButton: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.managedObjectContext) var viewContext
    var wordController = WordController()
    @State var showAlert = false
    @ObservedObject var word : Word

    var body: some View {
        
        Button {
            showAlert = true
            
        } label : {
            Text("Delete word")
                .foregroundColor(.black)
                .padding()
                .background(Color("SecondaryColor"))
                .cornerRadius(22)
                .frame(maxWidth: 300)
        }
        .alert(isPresented: $showAlert) {
            // There is not a way to alter the order of primaryButton and secondaryButton, destructive button will always come last from left to right
            Alert(
                title: Text("Delete word : \(word.name ?? "Unkown")?"),
                primaryButton: .cancel(Text("Cancel")),
                secondaryButton: .destructive(Text("Delete")) {
                    presentationMode.wrappedValue.dismiss()
                    wordController.removeItem(viewContext: viewContext, word: word)
                }
            )
        }
    }
}
//
//struct VerbViewSettings_Previews: PreviewProvider {
//    static var previews: some View {
//        VerbViewSettings( word: Word())
//    }
//}
