//
//  WordController.swift
//  Chebravo
//
//  Created by Phillip Lundin on 27/06/2022.
//

import Foundation
import SwiftUI
import CoreData


class WordController {
    @Environment(\.managedObjectContext) var modelContainer
    
    
    
    func GetWords() -> NSFetchRequest<Word> {
        let fetchRequest: NSFetchRequest<Word> = Word.fetchRequest()
        return fetchRequest
    }
    
    func SaveWord() {
        
    }
    
    func LogWordsInConsole() {
        
    }
    
    init() {
        let word = Word(context: modelContainer)
        word.name = "Hello"
        try? modelContainer.save()
        print(GetWords())
    }

}
