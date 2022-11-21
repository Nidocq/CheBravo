//
//  LearnPossession.swift
//  Chebravo
//
//  Created by Phillip Lundin on 28/08/2022.
//

import SwiftUI

struct ModulePossession: ILearning {
    
    var id: UUID = UUID()
    
    static var MATERIAL_TITLE : String = "Possessive Adjectives"
    static var MATERIAL_TITLE_IT: String = "Gli Aggettivi Possessivi"
    static var ICON_NAME : String = "figure.wave"
    
    var body: some View {
        Text("yeah idk")
    }
}

struct LearnPossession : View {
    var body: some View {
        LearningMaterialBoilerPlate(
            ModuleContent: AnyView(ModuleConjugation()),
            MATERIAL_TITLE: ModulePossession.MATERIAL_TITLE,
            MATERIAL_TITLE_IT: ModulePossession.MATERIAL_TITLE_IT
        )
    }
}

struct LearnPossession_Previews: PreviewProvider {
    static var previews: some View {
        LearnPossession()
    }
}
