//
//  LearnNumbers.swift
//  Chebravo
//
//  Created by Phillip Lundin on 23/07/2022.
//

import SwiftUI
import AVFoundation

/// <summary> All the numbers is the learning material for this view </summary>
struct ModuleNumbers: ILearning {
    var id = UUID()
    
    static let MATERIAL_TITLE : String = "Numbers"
    static var MATERIAL_TITLE_IT: String = "I Numeri"
    static let ICON_NAME : String = "textformat.123"
    

    
    @State var CurrentNumberFirst : Int = 3
    @State var CurrentNumberSecond : Int = 3
    @State var CurrentNumberThird : Int = 3
    
    init() {
        // Styling the navigationbar
        let navBarAppearance = UINavigationBar.appearance()
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor(Color("SecondaryColor"))]
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor(Color("SecondaryColor"))]
    }
    
    var body: some View {
        // Text and the number wheel
        VStack {
            Text("Here we will present you for all the numbers that are necessary to learn when you endaviour into the italian language You will get fluent within no time lorum lorum")
                .foregroundColor(Color("SecondaryColor"))
                // Not to interfer with the NavigationTitle (.top)
                .padding([.trailing, .leading, .bottom], 10)
        }
        
        // 0-30
        VStack {
            NumberWheelView(numberFromHeader: "0 - 30", CurrentNumber: $CurrentNumberFirst)
            LearningHeading()
            LearningExample(
                ItalianExample: "Oggi è ventotto trentuno gradi!",
                EnglishTranslation: "Today is twenty-two degrees!")
            LearningExample(
                ItalianExample: "Quanto costa il gilato?",
                EnglishTranslation: "How much does the ice cream cost?")
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
        .padding()
        .padding(.bottom, 50)

        
        // 30 - 100
        VStack {
            NumberWheelView(numberFromHeader: "30 - 100", CurrentNumber: $CurrentNumberSecond)
            LearningHeading()
            LearningExample(
                // TODO: Examples for 30 - 100
                ItalianExample: "Oggi è trentuno gradi!",
                EnglishTranslation: "Today is thirty-one degrees!")
            LearningExample(
                ItalianExample: "Quanto costa il gilato?",
                EnglishTranslation: "How much does the ice cream cost?")
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
        .padding()
        .padding(.bottom, 50)

        
        // 100 - 1 000 000
        VStack {
            NumberWheelView(numberFromHeader: "100 - 1 000 000", CurrentNumber: $CurrentNumberThird)
            LearningHeading()
            LearningExample(
                ItalianExample: "Oggi è trentuno gradi!",
                EnglishTranslation: "I won 1 200 000 € in the lottery today")
            LearningExample(
                ItalianExample: "Quanto costa il gilato?",
                EnglishTranslation: "There are an estimated 6 000 000 people in Denmark")
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
        .padding()
    }
}

// MARK: Main body
struct LearnNumbers: View {
    var body: some View {
        LearningMaterialBoilerPlate(
            ModuleContent: AnyView(ModuleNumbers()),
            MATERIAL_TITLE: ModuleNumbers.MATERIAL_TITLE,
            MATERIAL_TITLE_IT: ModuleNumbers.MATERIAL_TITLE_IT
        )
    }
}

struct NumberWheelView : View {
    let numberFromHeader : String
    let NumberIT : [String] = [
        "Zero", "Uno", "Due", "Tre", "Quattro", "Cinque", "Sei", "Sette", "Otto", "Nove", "Dieci",
        "Undici", "Dodici", "Tredici", "Quattrodici", "Quindici", "Sedici", "Diciassette", "Diciotto", "Diciannove", "Venti",
        "Ventuno", "Ventidue", "Ventitré", "Ventiquattro", "Venticinque", "Ventisei", "Ventisette", "Ventotto", "Ventinove", "Trenta"
    ]
    let NumberEN : [String] = [
        "Zero", "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten",
        "Eleven", "Twelve", "Thirteen", "Fourteen", "Fifteen", "Sixteen", "Seventeen", "Eighteen", "Nineteen", "Twenty",
        "Twenty-one", "Twenty-two", "Twenty-three", "Twenty-four", "Twenty-five", "Twenty-six", "Twenty-seven", "Twenty-eight", "Twenty-nine", "Thirty"
    ]
    var AC : AudioController = AudioController()
    
    @Binding var CurrentNumber : Int
    
    var body: some View {
        VStack {
            VStack {
                Text("Numbers from ")
                    .foregroundColor(Color("SecondaryColor"))
                    .bold()
                    .font(.system(size: 18))
                    .padding(.top, 18)
                Text(numberFromHeader)
                    .foregroundColor(Color("SecondaryColor"))
                    .font(.system(size: 28))
                Seperator()
                    .padding(.bottom, 20)
                Picker("Number", selection: $CurrentNumber) {
                    ForEach(0..<31) { num in
                        HStack {
                            Text(String(num))
                                .padding(.leading, 50)
                            Spacer()
                            Text(String(NumberIT[num]))
                            Spacer()
                            Text(String(NumberEN[num]))
                            Spacer()
                        }
                        .foregroundColor(Color("SecondaryColor"))
                        
                    }
                }
            }
            .pickerStyle(WheelPickerStyle())
            
            // Pronunciation button
            Button {
                AC.playAudio(name: String(CurrentNumber))
            } label: {
                HStack {
                    Text("Pronunciation ")
                        .bold()
                    Image(systemName: "speaker.wave.2.fill")
                        .foregroundColor(Color("PrimaryColor"))
                }
                .foregroundColor(Color("PrimaryColor"))
                .frame(maxWidth: .infinity, minHeight: 30)
                .padding([.top, .bottom], 8)
                .background(Color("SecondaryColor"))
                .cornerRadius(20)
                .padding([.trailing, .leading], 22)
                .shadow(radius: 14, x: 2, y: 6)

            }
            .padding(.bottom)
        }
        .padding()
    }
}

struct LearnNumbers_Previews: PreviewProvider {
    static var previews: some View {
        LearnNumbers()
    }
}
