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
            
            if !(resultsWithAddition!.count == 0) {
                XCTFail()
            }
        }
    }
    
    //TODO: Make test for the addExample & removeExample
    // (With the help from above examples)
    func test_CheBravo_WordController_addExample() async {
        
    }
    
    func test_CheBravo_WordController_removeExample() async {
        
    }
    
    func helperFunction_GetWordFromViewContext(wordName : String) -> Word {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Word")
        fetchRequest.predicate = NSPredicate(format: "name contains[c] %@", wordName)
        let fetchPhilWord = try? self.viewContext.fetch(fetchRequest) as? [NSManagedObject]
        return fetchPhilWord![0] as! Word
    }
    
    func helperFunction_GetExampleFromViewContext() -> Example {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Example")
        fetchRequest.predicate = NSPredicate(format: "context contains[c] %@", "IsPhillipMatching")
        let fetchPhilWord = try? self.viewContext.fetch(fetchRequest) as? [NSManagedObject]
        return fetchPhilWord![0] as! Example
    }
    struct testingView : View {
        @StateObject var CDController = CoreDataController()
        @Environment(\.managedObjectContext) var viewContext

        @FetchRequest(sortDescriptors: [])
        var allExamples : FetchedResults<Example>
        
//        init(allExamples : FetchedResults<Example>) {
//            self.allExamples = allExamples
//        }
        
        var body: some View {
            Text("Hel")
                .environment(\.managedObjectContext, CDController.modelContainer.viewContext)
        }
    }
    func test_CheBravo_WordController_wordMatchExample() async {
        // Make the word be found in an example with the word
        // Make the word not be found in an example where the word IS NOT
        // Make the translated word be found in a translated
        // Make the translated word in translated example NOT be found
        // Check for accents where à and a is the same
        
        var ExampleContainer : [Example] = []
        for ex in testingView().allExamples {
            print(ex.context!)
        }
        //        var Examples: FetchedResults<Example> { fetchRequest.wrappedValue }
//        @FetchRequest var allExamples : FetchedResults<Example>
//
//        _allExamples = FetchRequest<Example>(sortDescriptors: [])
//        for ex in allExamples {
//            print(ex.context!)
//        }
        // Making word for testing the examples
//        await WC.addWord(viewContext: self.viewContext, Wordname: "isPhillipMatching")
//        await WC.addExample(viewContext: self.viewContext, ExampleText: "I love kindereggs and isPhillipMatching", note: "")
        
        // Fetching "isPhillipMatching" word after it has been added
//        let addedWord : Word = helperFunction_GetWordFromViewContext(wordName: "isPhillipMatching")

//        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Example")
//        fetchRequest.predicate = NSPredicate(format: "context contains[c] %@", "IsPhillipMatching")
//        let fetchPhilWord = try? self.viewContext.fetch(fetchRequest)
        
//        var fetchRequest = FetchRequest<Example>(fetchRequest: NSFetchRequest<Example>)
//        var AllExamples : FetchedResults<Example> { fetchRequest.wrappedValue }
        
//        WC.wordMatchExample(word: Word(context: self.viewContext), allExamples: fetchedExamples)
//        let fetchExamples = NSFetchRequest<NSFetchRequestResult>(entityName: "Example")
//        let examples = try? self.viewContext.fetch(fetchExamples) as? [NSManagedObject]

//        for ex in examples! {
//            print(
//                ExampleContainer.append()
//                (ex as! Example).context!
//                )
//        }
        
        // Clean up the viewContext
//        let addedExample : Example = helperFunction_GetExampleFromViewContext()
//        await WC.removeExample(viewContext: self.viewContext, Example: addedExample)
//        await WC.removeWord(viewContext: self.viewContext, word: addedWord)

//        viewContext
//        WC.wordMatchExample(word: <#T##Word#>, allExamples: <#T##FetchedResults<Example>#>)
    }
    
    
    
//    func test_CheBravo_WordController_wordMatchExample() {
//        var Examples : [Example] = WC.wordMatchExample(
//            word: "Hello",
//            allExamples: <#T##FetchedResults<Example>#>
//        )
//
//    }
}
