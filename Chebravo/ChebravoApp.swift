//
//  ChebravoApp.swift
//  Chebravo
//
//  Created by Phillip Lundin on 25/06/2022.
//

import SwiftUI


// TODO: Make a anti-hero animation when there are no words Something like -> "No words added, try adding one uphere *hint*
@main
struct ChebravoApp: App {
    @Environment(\.colorScheme) var colorScheme
    var body: some Scene {
        WindowGroup {
            SplashView()
        }
    }
}
