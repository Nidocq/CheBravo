//
//  LearnArticles.swift
//  Chebravo
//
//  Created by Phillip Lundin on 11/08/2022.
//

import SwiftUI

/// <summary> Articles like, They, them, he, she, etc is the learning material
/// in this material </summary>
struct LearnArticles: View, ILearning {
    let id = UUID()
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}


struct LearnArticles_Previews: PreviewProvider {
    static var previews: some View {
        LearnArticles()
    }
}
