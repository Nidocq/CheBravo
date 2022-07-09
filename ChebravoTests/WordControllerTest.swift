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
    var WC : WordController!
    
    override func setUp() {
        self.WC = WordController()
    }

    func test_CheBravo_WordController_IsInitialized() {
        XCTAssert(WC != nil)
        XCTAssert(WC is WordController)
    }
    
    func test_CheBravo_WordController_IsItemAdded() async {
        @StateObject var CDController = CoreDataController()
        var viewContext = CDController.modelContainer.viewContext
        
        await WC.addItem(viewContext: viewContext, Wordname: "Hello")
    }
}
