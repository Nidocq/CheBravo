//
//  ChebravoApp.swift
//  Chebravo
//
//  Created by Phillip Lundin on 25/06/2022.
//

import SwiftUI

@main
struct ChebravoApp: App {
    @Environment(\.colorScheme) var colorScheme
    var body: some Scene {
        WindowGroup {
            SplashView()
        }
    }
}
