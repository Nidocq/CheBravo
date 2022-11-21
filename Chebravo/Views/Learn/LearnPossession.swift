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
    
    let paddingOnTheSides : CGFloat = 14
    
    var body: some View {
        VStack(spacing: 10) {
            Text("The possessive adjectives describe who owns what. Two factors change outcome: If the word is masculine or femenine and if the word is plural or singular")
            
            PossessiveInfographic(
                isMasculine: true,
                isPlural: false,
                my: "mio",
                yours: "tuo",
                its: "suo",
                ours: "nostro",
                yoursPL: "vostro",
                their: "loro"
            )
            
            PossessiveInfographic(
                isMasculine: true,
                isPlural: false,
                my: "mia",
                yours: "tua",
                its: "sua",
                ours: "nostra",
                yoursPL: "vostra",
                their: "loro"
            )
            
            PossessiveInfographic(
                isMasculine: true,
                isPlural: true,
                my: "miei",
                yours: "tuoi",
                its: "suoi",
                ours: "nostri",
                yoursPL: "vostri",
                their: "loro"
            )
            
            PossessiveInfographic(
                isMasculine: false,
                isPlural: true,
                my: "mie",
                yours: "tue",
                its: "sue",
                ours: "nostre",
                yoursPL: "vostre",
                their: "loro"
            )

        }
            .foregroundColor(Color("SecondaryColor"))
            .padding([.leading, .trailing], paddingOnTheSides)
    }

}


struct PossessiveInfographic : View {
    let isMasculine : Bool
    let isPlural : Bool
    let my : String
    let yours : String
    let its : String
    let ours : String
    let yoursPL : String
    let their : String
    
    func DetermineGender() -> String {
        return isMasculine ? "♂" : "♀"
    }
    
    func DetermineQuantityIcon() -> String {
        return isPlural ? "person.3.sequence" : "person"
    }
    
    var body: some View {
        HStack {
            VStack(spacing: 10) {
                Text(DetermineGender())
                Image(systemName: DetermineQuantityIcon())
            }
            .font(.system(size: 40))
            HStack {
                Text(my)
                Text(yours)
                Text(its)
                Text(ours)
                Text(yoursPL)
                Text(their)
            }
        }
        .padding()
        .border(Color("SecondaryColor"))
    }
}

struct LearnPossession : View {
    var body: some View {
        LearningMaterialBoilerPlate(
            ModuleContent: AnyView(ModulePossession()),
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
