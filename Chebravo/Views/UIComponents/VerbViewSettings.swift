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
                Spacer()
                Text(word.name ?? "Unkown name")
                    .font(.system(size: 44))
                    .foregroundColor(.white)
                HStack {
                    Text("Date added:")
                    Text(word.date ?? Date(timeIntervalSinceReferenceDate: 0), style: .date)
                }
                    .font(.system(size: 24))
                    .foregroundColor(.white)
                    .opacity(0.8)
                Spacer()
                HStack {
                    Spacer()
                    Button {
                       dismiss()
                    } label: {
                        DeleteButton(word: word)
                    }
                    
                    Button {
                        dismiss()
                    } label: {
                        Text("Go back")
                            .foregroundColor(.black)
                            .padding()
                            .background(Color("SecondaryColor"))
                            .cornerRadius(22)
                            .frame(maxWidth: 300)
                    }
                    Spacer()
                }
                .padding(.bottom, 30)
            }
        }
    }
}

/// <summary> Deletes the current word from the CoreData database when the user clicks on it </summary>
/// <param name="word"> The specified word that needs to be deleted from the CoreData database </param>
struct DeleteButton: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.managedObjectContext) var viewContext
    var wordController = ContextController()
    @State var showAlert = false
    @ObservedObject var word : Word

    var body: some View {
        
        Button {
            showAlert = true
            
        } label : {
            Text("Delete word")
                .foregroundColor(.red)
                .padding()
                .background(Color("SecondaryColor"))
                .cornerRadius(22)
                .frame(maxWidth: 300)
        }
        .alert(isPresented: $showAlert) {
            // There is not a way to alter the order of primaryButton and secondaryButton,
            // destructive button will always come last from left to right
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
