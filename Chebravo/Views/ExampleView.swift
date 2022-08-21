//
//  YourExamples.swift
//  Chebravo
//
//  Created by Phillip Lundin on 22/07/2022.
//

import SwiftUI

/// <summary> Here are the examples that the user will have
/// acquired throughout their learning, showcased nicely </summary>
struct ExampleView: View {
    @State var showAddNewExample : Bool = false
   
    
    @FetchRequest(sortDescriptors: [
        SortDescriptor(\.date, order: .reverse)
    ]) var examples : FetchedResults<Example>

    var body: some View {
        NavigationView {
            ZStack {
                Color("PrimaryColor")
                    .ignoresSafeArea()
                
                VStack {
                    Text("Hello there ")
                    ForEach(examples, id: \.self) { ex in
                        Text(ex.context!)
                    }
                }
            }.toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        print("Adding card")
                        showAddNewExample = true
                    } label : {
                        Image(systemName: "plus")
                            .foregroundColor(Color("SecondaryColor"))
                    }
                }
            }.sheet(isPresented: $showAddNewExample) {
                AddNewExampleView()
            } .navigationTitle("Examples")
        }
    }
}

struct YourExamples_Previews: PreviewProvider {
    static var previews: some View {
        ExampleView()
    }
}
