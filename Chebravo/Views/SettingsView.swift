//
//  SettingsView.swift
//  Chebravo
//
//  Created by Phillip Lundin on 23/07/2022.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        ZStack {
            Color("PrimaryColor")
                .ignoresSafeArea()
            
            
            Text("Settings")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
