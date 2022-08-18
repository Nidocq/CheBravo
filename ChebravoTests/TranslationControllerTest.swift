//
//  TranslationControllerTest.swift
//  ChebravoTests
//
//  Created by Phillip Lundin on 18/08/2022.
//

import XCTest
import SwiftUI
@testable import Chebravo
// Naming structure: test_UnitOfWork_StateUnderTest_ExpectedBehavious

class TranslationControllerTest: XCTestCase {
    private var TC = TranslationController()
    
    func test_CheBravo_TranslationController_APIKeyLength() {
        XCTAssertNotNil(TC.ApiKey)
        
        // 39 is usually the length of an api key
        XCTAssertTrue(TC.ApiKey.count == 39)
    }

    func test_CheBravo_TranslationController_IsInitialized() {
        XCTAssertNotNil(TC)
    }
    
    func test_CheBravo_TranslationController_translateText_StringWithSpaces() async {
        var TranslatedText = await TC.translateText(text: "Grazie mille")
        print(TranslatedText)
        
        XCTAssertFalse(TranslatedText == "Unkown")
        XCTAssertNotNil(TranslatedText)
    }
    
    
    func test_CheBravo_TranslationController_translateText_InvalidCharacters() async {
        let invalidCharacter : [String] = [
            ".",
            ",",
            "!",
            "#",
            "%",
            "%20",
            "£",
            "∞",
            "¡",
            "§",
            "",
            "$",
            "{",
            "(",
            "-",
            "_",
            "`",
            "+",
            "<",
            ">"
        ]
        
        for inChar in invalidCharacter {
            print("Hello")
        }
    }
    
    func test_CheBravo_TranslationController_translateText_WithQuotes() async {
    }

}
