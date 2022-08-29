//
//  LearnTime.swift
//  Chebravo
//
//  Created by Phillip Lundin on 28/08/2022.
//

import SwiftUI

struct ModuleTime: ILearning {
    var id: UUID = UUID()
    
    static var MATERIAL_TITLE: String = "Time"
    
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
            MATERIAL_TITLE: ModuleTime.MATERIAL_TITLE)
    }
}

struct LearnTime_Previews: PreviewProvider {
    static var previews: some View {
        LearnTime()
    }
}
