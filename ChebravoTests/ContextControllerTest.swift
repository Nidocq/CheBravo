//
//  WordControllerTest.swift
//  ChebravoTests
//
//  Created by Phillip Lundin on 09/07/2022.
//

import XCTest
import SwiftUI
@testable import Chebravo
// Naming structure: test_UnitOfWork_StateUnderTest_ExpectedBehavious

class WordControllerTest: XCTestCase {
    var WC : ContextController!
    
    override func setUp() {
        self.WC = ContextController()
    }

    func test_CheBravo_WordController_IsInitialized() {
        XCTAssert(WC != nil)
        XCTAssert(WC is ContextController)
    }
    
    func test_CheBravo_WordController_IsItemAdded() async {
        @StateObject var CDController = CoreDataController()
        var viewContext = CDController.modelContainer.viewContext
        
        await WC.addWord(viewContext: viewContext, Wordname: "Hello")
    }
}
