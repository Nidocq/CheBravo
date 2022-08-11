//
//  LearnView.swift
//  Chebravo
//
//  Created by Phillip Lundin on 22/07/2022.
//

import SwiftUI

struct LearnView: View {
    
//    var LearningMaterial : [ILearning] = [
//        LearnNumbers()
//        // LearnArticles()
//        // Learn...()
//    ]
    
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
                
                
//                ForEach(LearningMaterial, id: \.id) { mat in
//
//                }
                VStack {
                    NavigationLink(destination: LearnNumbers()) {
                        HStack {
                            Text("Learn Numbers ")
                            Image(systemName: "list.number")
                        }
                            .foregroundColor(Color("SecondaryColor"))
                        
                    }
                
                    NavigationLink(destination: LearnArticles()) {
                        HStack {
                            Text("Learn Articles ")
                            Image(systemName: "list.number")
                        }
                    }
                }
                .foregroundColor(Color("SecondaryColor"))
            }
            .navigationTitle("Learn")
        }
    }
}

struct LearnView_Previews: PreviewProvider {
    static var previews: some View {
        LearnView()
    }
}
