//
//  Extensions.swift
//  Chebravo
//
//  Created by Phillip Lundin on 29/06/2022.
//

import Foundation
import SwiftUI


/// Word type
enum WordType : String {
    case adjective = "Adjective"
    case noun = "Noun"
    case verb = "Verb"
}

enum ConjugationProcess : String {
    case first = "are"
    case second = "ere"
    case third = "ire"
}
