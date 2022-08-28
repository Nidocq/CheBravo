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
    private var failedMessageForTranslation = "Unkown"
    
    func test_CheBravo_TranslationController_APIKeyLength() {
        XCTAssertNotNil(TC.ApiKey)
        
        // 39 is usually the length of an api key
        XCTAssertTrue(TC.ApiKey.count == 39)
    }

    func test_CheBravo_TranslationController_IsInitialized() {
        XCTAssertNotNil(TC)
    }
    
    // Make sure that spaces is possible when making examples
    func test_CheBravo_TranslationController_translateText_StringWithSpaces() async {
        let TranslatedText = await TC.translateText(text: "Grazie mille")
        print(TranslatedText)
        
        XCTAssertFalse(TranslatedText == failedMessageForTranslation)
        XCTAssertNotNil(TranslatedText)
    }
    
    // Only spaces should only return ""
    func test_CheBravo_TranslationController_translateText_OnlySpaces() async {
        let listOfInput : [String] = [
            "    ",
            "                              ",
            "",
            " "
        ]
        
        var translatedInput : String
        for input in listOfInput {
            translatedInput = await TC.translateText(text: input)
            XCTAssertEqual(translatedInput, "")
            
        }
    }
    

    func test_CheBravo_TranslationController_translateText_InvalidCharacters() async {
        // Invalid characters
        // "%", "%20", "£", "∞", "‰", "¢", "¡", "§", "", "$", "{", "}", "-", "_", "`", "<", ">"
        
        var testList : [String] = [
            
        ]
        testList.append(await TC.translateText(text: "I love  100% because they make £¢$ !!!¡¡¡"))
        testList.append(await TC.translateText(text: "What is 2‰ of ∞ even mean when calculating?"))
        testList.append(await TC.translateText(text: "I remember that < is less and > is bigger :)"))
        testList.append(await TC.translateText(text: "03c+$v.-{}_"))
        testList.append(await TC.translateText(text: "`'`"))

        for TransTest in testList {
            XCTAssertNotEqual(TransTest, failedMessageForTranslation)
        }
    }
    
    func test_CheBravo_TranslationController_translateText_accents() async {
        let sutTranslation = await TC.translateText(text: "àÀÁáèÈéÉìÌóÓùÙ")
        
        XCTAssertEqual("aAAaeEeEiIoOuU", sutTranslation)
    }

    
    func test_CheBravo_TranslationController_translateText_WithQuotes() async {
    }

}
