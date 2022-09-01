//
//  WordController.swift
//  Chebravo
//
//  Created by Phillip Lundin on 27/06/2022.
//

import Foundation
import SwiftUI
import CoreData

/// <summary> Controls the behaviour of the words with the help of viewContexts </summary>
/// <remarks> I can't instantiate the NSManagedObjectContext with this class for some reason, even though
/// it probably would b better </remarks>
class ContextController : ObservableObject {
    @FetchRequest(sortDescriptors: []) var allWords: FetchedResults<Word>
    @FetchRequest(sortDescriptors: []) var allExamples : FetchedResults<Example>
    
    var TC : TranslationController = TranslationController()
    var Haptic = UINotificationFeedbackGenerator()

    // TODO: Make the number count for every word you have translated
    @AppStorage("wordsCreated") var wordsCreated : Int?
        
    /// <summary> Creates and adds a specified word to the NSManagedObjectContext. </summary>
    /// <param name="viewContext"> The NSManagedObjectContext given in which the word needs to be saved to</param>
    /// <param name="WordName"> The name of the word that needs to be saved to the viewContext</param>
    func addWord(viewContext : NSManagedObjectContext, Wordname : String) async {
        guard (Wordname != "") else { return }
            let newWord = Word(context: viewContext)
            newWord.name = Wordname
            newWord.date = Date.now
            // if word is unvalid this will become "Unkown"
            newWord.translationToEnglish = await TC.translateText(text: Wordname)
            try? viewContext.save()
            Haptic.notificationOccurred(.success)
            
    }
    
    /// <summary> Creates and adds a specified example to the NSManagedObjectContext. </summary>
    /// <param name="viewContext"> The NSManagedObjectContext given in which the item needs to be saved to</param>
    /// <param name="WordName"> The name of the example that needs to be saved to the viewContext</param>
    /// <remarks> I have added two different functions for this because the objects are different and easier to modify
    /// if the objects change in functionality </remarks>
    func addExample(viewContext : NSManagedObjectContext, ExampleText : String, note : String) async {
        guard (ExampleText != "") else { return }
            let newExample = Example(context: viewContext)
            newExample.context = ExampleText
            newExample.date = Date.now
            newExample.note = note
            // if example is unvalid this will become "Unkown"
            newExample.translationToEnglish = await TC.translateText(text: ExampleText)
            try? viewContext.save()
            Haptic.notificationOccurred(.success)
            
    }
    
    
    /// <summary> Removes an item from the NSManagedObjectContext </summary>
    /// <param name="viewContext"> NSManagedObjectContext in which the word needs to be removed </param>
    /// <param name="word"> Word class that needs to be deleted from the viewContext </param>
    func removeWord(viewContext : NSManagedObjectContext, word : Word) async {
        withAnimation {
            viewContext.delete(word)
            try? viewContext.save()
        }
        Haptic.notificationOccurred(.success)
    }
    
    /// <summary> Removes an Example from the NSManagedObjectContext </summary>
    /// <param name="viewContext"> NSManagedObjectContext in which the example needs to be removed </param>
    /// <param name="word"> Example that needs to be deleted from the viewContext </param>
    func removeExample(viewContext : NSManagedObjectContext, Example : Example) async {
        withAnimation {
            viewContext.delete(Example)
            try? viewContext.save()
        }
        Haptic.notificationOccurred(.success)
    }
    
    /// <summary> Search for a word in all the examples. If a word is found in
    /// one or more of the examples it will return that list (for being
    /// displayed in a view) </summary>
    /// <param name="word"> word which name will be searched for in all examples
    /// </param>
    /// <param name="allExampmles"> all examples in which the word name
    /// is searched through </param>
    /// <remarks> The translated word will also compare to a translated example
    /// </remarks>
    func wordMatchExample(word : Word, allExamples : FetchedResults<Example>) -> [Example] {
        // Make the word be found in an example with the word
        // Make the word not be found in an example where the word IS NOT
        // Make the translated word be found in a translated
        // Make the translated word in translated example NOT be found
        // Check for accents where à and a is the same
        // __________________
//        if let word = word {
//            for ex in allExamples {
//                if let ex = ex {
//                    print(ex.context)
//                } else {
//                    print("Coulnd't find example")
//                }
//            }
//        }
//
//        if (word! == nil | !allExamples.isEmpty) {
//        }
        return []
        
    }
}
