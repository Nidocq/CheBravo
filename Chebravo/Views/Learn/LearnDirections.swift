//
//  LearnDirections.swift
//  Chebravo
//
//  Created by Phillip Lundin on 28/08/2022.
//

import SwiftUI

struct ModuleDirections: ILearning {
    
    var id: UUID = UUID()
    
    static var MATERIAL_TITLE: String = "Directions"
    static var MATERIAL_TITLE_IT: String = "Le Direzioni"
    static var ICON_NAME : String = "arrow.up.right.and.arrow.down.left.rectangle"
    
    var body: some View {
        VStack {
            HStack {
                Text("Sinistra")
                Spacer()
                Text("Destra")
            }
            .padding(15)
        }
        .foregroundColor(Color("SecondaryColor"))
    }
}

struct LearnDirections : View {
    var body: some View {
        LearningMaterialBoilerPlate(
            ModuleContent: AnyView(ModuleDirections()),
            MATERIAL_TITLE: ModuleDirections.MATERIAL_TITLE,
            MATERIAL_TITLE_IT: ModuleDirections.MATERIAL_TITLE_IT
        )
    }
}

struct LearnDirections_Previews: PreviewProvider {
    static var previews: some View {
        LearnDirections()
    }
}
