//
//  LearnView.swift
//  Chebravo
//
//  Created by Phillip Lundin on 22/07/2022.
//

import SwiftUI

struct LearnView: View {
    
    init() {
        let navBarAppearance = UINavigationBar.appearance()
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor(Color("SecondaryColor"))]
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor(Color("SecondaryColor"))]
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("PrimaryColor")
                    .ignoresSafeArea()
                
                
                Text("Learning is fun!!")
                    .foregroundColor(.white)
            }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .navigationTitle("Learning")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            
                        } label: {
                            Image(systemName: "list.bullet")
                                .foregroundColor(Color("SecondaryColor"))
                        }
                    }
                }
        }
       
    }
}

struct LearnView_Previews: PreviewProvider {
    static var previews: some View {
        LearnView()
    }
}
