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
    @Environment(\.managedObjectContext) var modelContainer
    
    init() {
        let word = Word(context: modelContainer)
        word.name = "Hello"
        try? modelContainer.save()
    }
    
    
    
    func GetWords() -> FetchedResults<Word> {
        @FetchRequest(sortDescriptors: []) var words : FetchedResults<Word>
        return words
    }
    
    func SaveWord() {
        
    }
    
    func LogWordsInConsole() {
        
    }

}
