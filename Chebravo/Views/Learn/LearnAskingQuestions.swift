//
//  LearnAskingQuestions.swift
//  Chebravo
//
//  Created by Phillip Lundin on 28/08/2022.
//

import SwiftUI

struct ModuleAskingQuestions: ILearning {
    var id: UUID = UUID()
    static var MATERIAL_TITLE: String = "Asking Questions"
    
    
    var body: some View {
        VStack {
            Text("How are you?")
        }
        .foregroundColor(Color("SecondaryColor"))
    }
}

struct LearnAskingQuestions : View {
    var body: some View {
        LearningMaterialBoilerPlate(
            ModuleContent: AnyView(ModuleAskingQuestions()),
            MATERIAL_TITLE: ModuleAskingQuestions.MATERIAL_TITLE)
        }
}


struct LearnAskingQuestions_Previews: PreviewProvider {
    static var previews: some View {
        LearnAskingQuestions()
    }
}
