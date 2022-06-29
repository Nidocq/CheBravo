//
//  WordController.swift
//  Chebravo
//
//  Created by Phillip Lundin on 27/06/2022.
//

import Foundation
import SwiftUI
import CoreData




class WordController : ObservableObject {
    @Environment(\.managedObjectContext) var viewContext
    
    
    func addItem(viewContext : NSManagedObjectContext) {
        withAnimation {
            print("Hello there ia m been made")
            let newWord = VerbWord(context: viewContext)
            newWord.name = "Hello there"
            try? viewContext.save()
        }
    }
}
