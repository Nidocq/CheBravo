////
////  WordController.swift
////  Chebravo
////
////  Created by Phillip Lundin on 27/06/2022.
////
//
//import Foundation
//import SwiftUI
//import CoreData
//
//
//class WordController : ObservableObject {
//    @Environment(\.managedObjectContext) var modelContainer
//    
//    @Published var words : FetchedResults<Word>
//    
//    init() {
//        @FetchRequest(sortDescriptors: [])  var FetchedWords : FetchedResults<Word>
//        self.words = FetchedWords
//    }
//    
//    
//    
//    func UpdateWords() {
//        @FetchRequest(sortDescriptors: []) var words : FetchedResults<Word>
//        self.words = words
//    }
//    
//    func SaveWord() {
//        
//    }
//    
//    func LogWordsInConsole() {
//        
//    }
//
//}
