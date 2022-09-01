//
//  ContextControllerTest.swift
//  ChebravoTests
//
//  Created by Phillip Lundin on 09/07/2022.
//

import XCTest
import SwiftUI
import CoreData
@testable import Chebravo
// Naming structure: test_UnitOfWork_StateUnderTest_ExpectedBehavious

class ContextControllerTest: XCTestCase {
    var WC : ContextController!
    @StateObject var CDController = CoreDataController()
    // NSManagedObjectContext
    // NSPersistentContainer
    var viewContext: NSManagedObjectContext!
    
    override func setUp() {
        self.WC = ContextController()
        self.viewContext = CDController.modelContainer.viewContext
    }

    func test_CheBravo_WordController_IsInitialized() {
        XCTAssert(WC != nil)
        XCTAssert(WC is ContextController)
    }
    
    // PRECONDITION: Be sure that there is only one obj with the name
    // "PhillipIsTesting" Got help from https://stackoverflow.com/questions/26345189/how-do-you-update-a-coredata-entry-that-has-already-been-saved-in-swift
    // and https://stackoverflow.com/questions/24176605/using-predicate-in-swift/27219973#27219973
    func test_CheBravo_WordController_addWord() async {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Word")
        // Getting all the words that has "PhillipIsTesting" as name
        fetchRequest.predicate = NSPredicate(format: "name contains[c] %@", "PhillipIsTesting")
        
        let results = try? self.viewContext.fetch(fetchRequest) as? [NSManagedObject]
        
        // No word with the name PhillipIsTesting should have been set yet
        if !(results?.count == 0) {
            XCTFail()
        }
        
        // SUT
        await WC.addWord(viewContext: self.viewContext, Wordname: "PhillipIsTesting")
        
        // I don't know why, but waiting 1.5 seconds helps with the await
        // function above before we assess the results
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            let resultsWithAddition = try? self.viewContext.fetch(fetchRequest) as? [NSManagedObject]
            // If a word is not added it has failed
            if (resultsWithAddition?.count == 0) {
                XCTFail()
            }
            
            XCTAssertEqual(
                String((resultsWithAddition?[0] as! Word).name!),
                "PhillipIsTesting"
            )
        }
    }
    
    // PRECONDITION: A word with "PhillipIsTesting" as name has to exist in the
    // NSManagedObjectContext context
    func test_CheBravo_WordController_removeWord() async {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Word")
        fetchRequest.predicate = NSPredicate(format: "name contains[c] %@", "PhillipIsTesting")
        
        let results = try? self.viewContext.fetch(fetchRequest) as? [NSManagedObject]
        
        // Make sure that a "PhillipIsTesting" word exists in the viewContext
        if (results!.count == 0) {
            XCTFail()
        }
        let getWord : Word = results![0] as! Word
        
        // SUT
        await WC.removeWord(viewContext: self.viewContext, word: getWord)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            let resultsWithAddition = try? self.viewContext.fetch(fetchRequest) as? [NSManagedObject]
            
            if !(results!.count == 0) {
                XCTFail()
            }
        }
    }
    
    //TODO: Make test for the addExample (With the help from above examples
    func test_CheBravo_WordController_addExample() async {
        
    }
    
    func test_CheBravo_WordController_addExample() async {
        
    }
    
    func test_CheBravo_WordController_wordMatchExample() {
        
    }
    
    
    
//    func test_CheBravo_WordController_wordMatchExample() {
//        var Examples : [Example] = WC.wordMatchExample(
//            word: "Hello",
//            allExamples: <#T##FetchedResults<Example>#>
//        )
//
//    }
}
