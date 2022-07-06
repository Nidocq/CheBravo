//
//  TranslationResponse.swift
//  Chebravo
//
//  Created by Phillip Lundin on 02/07/2022.
//

import Foundation

struct TranslationResponse: Decodable {
    let translations: [Translation]
}

struct Translation : Decodable {
    let detectedSourceLanguage, text: String
}
