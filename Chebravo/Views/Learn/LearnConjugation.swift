//
//  LearnConjugation.swift
//  Chebravo
//
//  Created by Phillip Lundin on 28/08/2022.
//

import SwiftUI

struct ModuleConjugation: ILearning {
    
    var id: UUID = UUID()
    static var MATERIAL_TITLE : String = "Conjugation & Verbs"
    static var MATERIAL_TITLE_IT: String = "I Verbi"
    static var ICON_NAME : String = "table"
    
    var body: some View {
        VStack {
            Text("hle")
            Text("Andare")
        }
        .foregroundColor(Color("SecondaryColor"))
    }
}


struct LearnConjugation : View {
    var body: some View {
        LearningMaterialBoilerPlate(
            ModuleContent: AnyView(ModuleConjugation()),
            MATERIAL_TITLE: ModuleConjugation.MATERIAL_TITLE,
            MATERIAL_TITLE_IT: ModuleConjugation.MATERIAL_TITLE_IT
        )
    }
}

struct LearnConjugation_Previews: PreviewProvider {
    static var previews: some View {
        LearnConjugation()
    }
}
