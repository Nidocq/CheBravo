//
//  ChebravoApp.swift
//  Chebravo
//
//  Created by Phillip Lundin on 25/06/2022.
//

import SwiftUI

// TODO: Have a database that checks for common words.
//      * Maybe every 500 most common words have their conjugation

@main
struct ChebravoApp: App {
    
    @Environment(\.colorScheme) var colorScheme
    var body: some Scene {
        WindowGroup {
            SplashView()
        }
    }
}
