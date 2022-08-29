//
//  LearnArticles.swift
//  Chebravo
//
//  Created by Phillip Lundin on 11/08/2022.
//

import SwiftUI

/// <summary> Articles as "The, a, an" and how to use them in Italian </summary>
struct ArticleModule : ILearning {
    var id: UUID = UUID()
    
    static let MATERIAL_TITLE = "Articles"
    
    var body: some View {
        VStack {
            Text("There are only three articles:")
            Text("The, a, an")
            Text("But In italian there are seven!")
            Text("il, i, le, la, l', gli, lo")
        }
        .foregroundColor(Color("SecondaryColor"))
    }
}

/// <summary> Boiler plate implementation with the module constructed above
/// </summary>
struct LearnArticles: View {
    
    var body: some View {
        LearningMaterialBoilerPlate(
            ModuleContent: AnyView(ArticleModule()),
            MATERIAL_TITLE: ArticleModule.MATERIAL_TITLE
        )
    }
}

struct LearnArticles_Previews: PreviewProvider {
    static var previews: some View {
        LearnArticles()
    }
}
