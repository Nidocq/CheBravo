//
//  YourExamples.swift
//  Chebravo
//
//  Created by Phillip Lundin on 22/07/2022.
//

import SwiftUI

/// <summary> Here are the examples that the user will have
/// acquired throughout their learning, showcased nicely </summary>
struct AllExamples: View {
    @State var showAddNewExample : Bool = false
    
    let paddingFromTitleToExamples : CGFloat = 30
    
    @FetchRequest(sortDescriptors: [
        SortDescriptor(\.date, order: .reverse)
    ]) var examples : FetchedResults<Example>

    var body: some View {
        NavigationView {
            ZStack {
                Color("PrimaryColor")
                    .ignoresSafeArea()
                
                VStack {
                    Seperator(paddingLeadingTrailing : 0)
                        .padding(.top, 15)
                    
                    ScrollView {
                        ForEach(examples, id: \.self) { ex in
                            NavigationLink(
                                destination: ExampleView(example: ex)
                            ) {
                                // TODO: Make a component here for readability
                                ExampleShowCase(ex: ex)
                            }
                            Seperator()
                        }
                    }
                    .padding(.top, paddingFromTitleToExamples)
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

struct Seperator : View {
    var paddingLeadingTrailing : CGFloat = 20 + 10

    
    var body: some View {
        Rectangle()
            .frame(
                width: UIScreen.main.bounds.width-paddingLeadingTrailing*2,
                height: 2
            )
            .foregroundColor(Color("SecondaryColor"))
    }
}


struct ExampleShowCase : View {
    let ex : Example
    let paddingLeadingTrailing : CGFloat = 20
    let paddingTopBottom : CGFloat = 25

    
    var body: some View {
        VStack(alignment: .leading) {
            Text(ex.note ?? "No Note")
                .bold()
                .font(.system(size: 24))
            Text(ex.context ?? "")
        }
        .foregroundColor(Color("SecondaryColor"))
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
        .background(Color("PrimaryColor"))
        .padding([.top, .bottom], paddingTopBottom)
        .padding([.leading, .trailing], paddingLeadingTrailing)
    }
}

struct YourExamples_Previews: PreviewProvider {
    static var previews: some View {
        AllExamples()
    }
}
