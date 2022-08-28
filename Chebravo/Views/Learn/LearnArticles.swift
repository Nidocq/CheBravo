//
//  LearnArticles.swift
//  Chebravo
//
//  Created by Phillip Lundin on 11/08/2022.
//

import SwiftUI

/// <summary> Articles as "The, a, an" and how to use them in Italian </summary>
struct ArticleModule : View {
    let MATERIAL_TITLE = "Articles"
    var body: some View {
        VStack {
            Text("There are only three articles:")
            Text("The, a, an")
            Text("But In italian there are seven!")
            Text("il, i, le, la, l', gli, lo")
        }
        .foregroundColor(Color("SecondaryColor"))
        .navigationTitle(MATERIAL_TITLE)
    }
}

/// <summary> Boiler plate implementation with the module constructed above
/// </summary>
struct LearnArticles: View, ILearning {
    @Environment(\.dismiss) var removeView
    let id = UUID()
    
    var body: some View {
        LearningMaterialBoilerPlate(
            ModuleContent: AnyView(ArticleModule())
        )
    }
}



//
//struct LearnArticles_Previews: PreviewProvider {
//    static var previews: some View {
//        LearnArticles(dismiss: false)
//    }
//}
