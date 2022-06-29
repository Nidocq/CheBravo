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
    
    
    ///
    /// <arg="viewContext"> </arg>
    func addItem(viewContext : NSManagedObjectContext, Wordname : String) {
        guard (Wordname != "") else { return }
        withAnimation {
            let newWord = Word(context: viewContext)
            newWord.name = Wordname
            try? viewContext.save()
        }
    }
    
    func removeItem(viewContext : NSManagedObjectContext, word : Word) {
        withAnimation {
            viewContext.delete(word)
            try? viewContext.save()
        }
    }
}
