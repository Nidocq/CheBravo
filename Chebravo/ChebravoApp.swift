//
//  ChebravoApp.swift
//  Chebravo
//
//  Created by Phillip Lundin on 25/06/2022.
//

import SwiftUI

// TODO: Make UNIT testing on the classes
// TODO: Make a anti-hero animation when there are no words Something like -> "No words added, try adding one uphere *hint*

// TODO: Do so you can add examples to a specific view as well
// TODO: Have a database that checks for common words.
//      * Maybe every 500 most common words have their conjugation

// TODO: Have a tutorial for how to learn
//      * Learn numbers
//      * Articles
//      * Masculine and feminine and their conjugation

// TODO: Have counter of current "Words you know!"

@main
struct ChebravoApp: App {
    
    @Environment(\.colorScheme) var colorScheme
    var body: some Scene {
        WindowGroup {
            SplashView()
        }
    }
}
