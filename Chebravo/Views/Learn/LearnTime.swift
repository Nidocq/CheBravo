//
//  LearnTime.swift
//  Chebravo
//
//  Created by Phillip Lundin on 28/08/2022.
//

import SwiftUI

struct ModuleTime: ILearning {
    
    var id: UUID = UUID()
    static var MATERIAL_TITLE : String = "Talking About Time"
    static var MATERIAL_TITLE_IT: String = "Il Tempo e Le Date"
    static var ICON_NAME : String = "clock"
    
    var body: some View {
        VStack {
            Text(" hihihii")
        }
        .foregroundColor(Color("SecondaryColor"))
    }
}

struct LearnTime : View {
    var body: some View {
        LearningMaterialBoilerPlate(
            ModuleContent: AnyView(ModuleTime()),
            MATERIAL_TITLE: ModuleTime.MATERIAL_TITLE,
            MATERIAL_TITLE_IT: ModuleTime.MATERIAL_TITLE_IT
        )
    }
}

struct LearnTime_Previews: PreviewProvider {
    static var previews: some View {
        LearnTime()
    }
}
