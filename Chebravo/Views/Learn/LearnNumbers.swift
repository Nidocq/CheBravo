//
//  LearnNumbers.swift
//  Chebravo
//
//  Created by Phillip Lundin on 23/07/2022.
//

import SwiftUI

struct LearnNumbers: View, ILearning {
    @Environment(\.dismiss) var dismiss
    
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
                                    Spacer()
                                    Text(String(num))
                                    Spacer()
                                    Text("IT[num]")
                                    Spacer()
                                    Text("en[num]")
                                    Spacer()
                                }
                                .foregroundColor(Color("SecondaryColor"))
                                
                            }
                        }
                        .pickerStyle(WheelPickerStyle())
                        .padding()
                        .padding([.trailing, .leading], 20)
                        
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
                
                    

                }
                Spacer()
                Spacer()
                Spacer()
                
                VStack {
                    
                    HStack() {
                        Text("Examples")
                            .fontWeight(.heavy)
                        Image(systemName: "bolt.shield")
                        
                    }
                    .font(.system(size: 30))
                    .foregroundColor(Color("SecondaryColor"))
                    
                    
                    HStack {
                        Text("Oggi è")
                        Text("trentuno")
                            .bold()
                        Text("gradi!")
                    }
                            .foregroundColor(Color("SecondaryColor"))
                    Text("Quando costa il gilato? ")
                        .foregroundColor(Color("SecondaryColor"))
                }
                .frame(maxWidth: .infinity)
                
                
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
