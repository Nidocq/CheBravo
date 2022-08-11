//
//  LearnNumbers.swift
//  Chebravo
//
//  Created by Phillip Lundin on 23/07/2022.
//

import SwiftUI

struct LearnNumbers: View, ILearning {
    @Environment(\.dismiss) var dismiss
    
    let NumberIT : [String] = [
        "Zero", "Uno", "Due", "Tre", "Quattro", "Cinque", "Sei", "Sette", "Otto", "Nove", "dieci",
        "Undici", "Dodici", "Tredici", "Quattrodici", "Quindici", "Sedici", "Diciassette", "Diciotto", "Diciannove", "Venti",
        "Ventuno", "Ventidue", "Ventitré", "Ventiquattro", "Venticinque", "Ventisei", "Ventisette", "Ventotto", "Ventinove", "Trenta"
    ]
    
    let NumberEN : [String] = [
        "Zero", "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten",
        "Eleven", "Twelve", "Thirteen", "Fourteen", "Fifteen", "Sixteen", "Seventeen", "Eighteen", "Nineteen", "Twenty",
        "Twenty-one", "Twenty-two", "Twenty-three", "Twenty-four", "Twenty-five", "Twenty-six", "Twenty-seven", "Twenty-eight", "Twenty-nine", "Thirty"
    ]
    
    @State var CurrentNumber : Int = 0
    var LearningMaterial : [ILearning] = [
        
    ]
    
    
    init() {
        let navBarAppearance = UINavigationBar.appearance()
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor(Color("SecondaryColor"))]
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor(Color("SecondaryColor"))]
    }
    
    var body: some View {
        ZStack {
            Color("PrimaryColor")
                .ignoresSafeArea()
            
            ScrollView {
                VStack {
                    
                    Text("Here we will present you for all the numbers that are necessary to learn when you endaviour into the italian language You will get fluent within no time")
                        .foregroundColor(.white)
                        .padding()
                    VStack {
                        VStack {
                            Text("Numbers from ")
                                .foregroundColor(Color("SecondaryColor"))
                                .bold()
                                .font(.system(size: 18))
                                .padding(.top, 18)
                            Text("0-30")
                                .foregroundColor(Color("SecondaryColor"))
                                .font(.system(size: 28))
                        }
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
                        .pickerStyle(WheelPickerStyle())
                        
                        Button {
                            
                        } label: {
                            Text("Sound on ")
                                .foregroundColor(Color("PrimaryColor"))
                                .frame(maxWidth: .infinity, minHeight: 30)
                                .background(Color("SecondaryColor"))
                                .padding()
                                .padding([.trailing, .leading], 22)
                                .shadow(radius: 14, x: 2, y: 6)
                        }
                        .padding(.bottom)
                    }
                    .border(Color("SecondaryColor"))
                    .padding()
                
                    

                }
                Spacer()
                Spacer()
                Spacer()
                
                VStack {
                    
                    HStack {
                        Text("Examples")
                            .fontWeight(.heavy)
                        Image(systemName: "bolt.shield")
                        
                        
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                    .font(.system(size: 30))
                    .foregroundColor(Color("SecondaryColor"))
                    .padding(.bottom, 4)
                    
                    
                    LearningExample(ItalianExample: "Oggi è trentuno gradi!", EnglishTranslation: "Today is thirty-one degrees!")
                    LearningExample(ItalianExample: "Quanto costa il gilato?", EnglishTranslation: "How much does the ice cream cost?")
                    
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                .padding()
                
                
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .navigationTitle("Numbers")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    
                } label: {
                    Image(systemName: "list.bullet")
                        .foregroundColor(Color("SecondaryColor"))
                }
            }
            
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                    HStack {
                        Image(systemName: "chevron.left")
                        Text(" Back")
                    }
                    .foregroundColor(Color("SecondaryColor"))
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct LearnNumbers_Previews: PreviewProvider {
    static var previews: some View {
        LearnNumbers()
    }
}


struct LearningExample : View {
    var ItalianExample : String
    var EnglishTranslation : String
    
    var body : some View {
        VStack(alignment: .leading) {
            
            Text(ItalianExample)
                        .fontWeight(.bold)
            
            VStack {
                HStack {
                    Image(systemName: "arrow.turn.down.right")
                        .padding(.leading, 30)
                    Text(EnglishTranslation)
                }
            }
        }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            .foregroundColor(Color("SecondaryColor"))
    }
}
