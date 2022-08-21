//
//  ExampleView.swift
//  Chebravo
//
//  Created by Phillip Lundin on 21/08/2022.
//

import SwiftUI

struct ExampleView: View {
    @Environment(\.managedObjectContext) var viewContext

    var example : Example
    let paddingOnSides : CGFloat = 25
    var CC = ContextController()
    
    var body: some View {
        ZStack {
            Color("PrimaryColor")
                .ignoresSafeArea()
            
            
            // All components
            VStack {
                
                // Heading and example
                VStack(alignment: .leading) {
                    Text(example.note ?? "Heading")
                        .bold()
                        .font(.system(size: 24))
                    Text(example.context ?? "Unkown")
                }
                    .padding([.leading, .trailing], paddingOnSides)
                    .padding([.top, .bottom], 16)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(.white)
                
                // Translation header
                VStack(alignment: .leading) {
                    Text("Translation")
                        .bold()
                        .font(.system(size: 24))
                    Text(example.translationToEnglish ?? "Unkown")
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(Color("SecondaryColor"))
                .padding(.top, 10)
                .padding([.trailing, .leading], paddingOnSides)
                
                // TODO: Refer to other examples to understand meaning a little better. e.g.
                // rubato -> rubare word and another example of "voglio rubare gli gilati" :laughing:
                
                Spacer()
                Button {
                    Task {
                        do {
                            await CC.removeExample(viewContext: viewContext, Example: example)
                        }
                    }
                } label: {
                    Text("Delete Example")
                        .foregroundColor(Color("PrimaryColor"))
                        .frame(width: UIScreen.main.bounds.width-paddingOnSides*2, height: 50)
                        .background(Color("SecondaryColor"))
                        .cornerRadius(20)
                    
                }.padding(.bottom, 25)
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(false)
        .navigationTitle("")
        .navigationBarTitleDisplayMode(.inline)
    }
}

//struct ExampleView_Previews: PreviewProvider {
//    static var previews: some View {
//        ExampleView(example: Example())
//    }
//}
