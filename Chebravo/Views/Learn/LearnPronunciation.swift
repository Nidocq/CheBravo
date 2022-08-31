//
//  LearnPronunciation.swift
//  Chebravo
//
//  Created by Phillip Lundin on 28/08/2022.
//

import SwiftUI

struct ModulePronunciation: ILearning {
    var id: UUID = UUID()
    static var MATERIAL_TITLE: String = "Pronunciation"
    static var ICON_NAME : String = "message"
    
    var body: some View {
        VStack {
            Text("Pronunciation")
                .font(.title)
            Divider()
            Text("This is cool because")
            Text("che makes kə")
            Text("ce makes sh")
        }
        .foregroundColor(Color("SecondaryColor"))
    }
}

struct LearnPronunciation : View {
    
    var body: some View {
        LearningMaterialBoilerPlate(
            ModuleContent: AnyView(ModulePronunciation()),
            MATERIAL_TITLE: ModulePronunciation.MATERIAL_TITLE
        )
    }
}


struct LearnPronunciation_Previews: PreviewProvider {
    static var previews: some View {
        LearnPronunciation()
    }
}
