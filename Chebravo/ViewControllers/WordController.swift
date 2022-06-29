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
    
    func addItem(viewContext : NSManagedObjectContext) {
        withAnimation {
            print("Hello there ia m been made")
            let newWord = Word(context: viewContext)
            newWord.name = "Hello there"
            try? viewContext.save()
        }
    }
    
    func removeItem(viewContext : NSManagedObjectContext, word : Word) {
        withAnimation {
            viewContext.delete(word)
        }
    }
}
