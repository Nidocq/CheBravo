//
//  Verb.swift
//  Chebravo
//
//  Created by Phillip Lundin on 28/06/2022.
//

import Foundation

/// Word type
enum WordType : String {
    case adjective = "Adjective"
    case noun = "Noun"
    case verb = "Verb"
}

enum ConjugationProcess : String {
    case fist = "are"
    case second = "ere"
    case third = "ire"
}

struct VerbModel : WordModel {
    var name: String
    
    var wordType : WordType
    var conjugationProcess : ConjugationProcess
}
