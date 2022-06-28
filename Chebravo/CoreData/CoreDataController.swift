//
//  CoreDataController.swift
//  Chebravo
//
//  Created by Phillip Lundin on 27/06/2022.
//

import Foundation
import CoreData
import SwiftUI

class CoreDataController: ObservableObject {
    let modelContainer = NSPersistentContainer(name: "WordCore")
    
    init() {
        modelContainer.loadPersistentStores { desc, error in
            if let error = error {
                print("Core data failed to load data \(error.localizedDescription)")
            }
        }
    }
    
    func FetchWords() -> FetchedResults<Word> {
        @FetchRequest(sortDescriptors: []) var words : FetchedResults<Word>
        return words
    }
    
    
    
}
