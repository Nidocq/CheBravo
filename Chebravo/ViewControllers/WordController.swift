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
class WordController : ObservableObject {
    
    var translationController = TranslationController()
    
    /// <summary> Creates and adds a specified item to the NSManagedObjectContext. </summary>
    /// <param name="viewContext"> The NSManagedObjectContext given in which the item needs to be saved to</param>
    /// <param name="WordName"> The name of the word that needs to be saved to the viewContext</param>
    func addItem(viewContext : NSManagedObjectContext, Wordname : String) {
        guard (Wordname != "") else { return }
        withAnimation(.easeInOut) {
            let newWord = Word(context: viewContext)
            newWord.name = Wordname
            newWord.date = Date.now
            newWord.translationToEnglish = translationController.translateText(text: Wordname)
            try? viewContext.save()
        }
    }
    
    
    /// <summary> Removes an item from the NSManagedObjectContext </summary>
    /// <param name="viewContext"> NSManagedObjectContext in which the word needs to be removed </param>
    /// <param name="word"> Word class that needs to be deleted from the viewContext </param>
    func removeItem(viewContext : NSManagedObjectContext, word : Word) {
        withAnimation {
            viewContext.delete(word)
            try? viewContext.save()
        }
    }
}
