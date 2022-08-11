//
//  SettingsView.swift
//  Chebravo
//
//  Created by Phillip Lundin on 23/07/2022.
//

import SwiftUI

/// <summary> List the different option and information for the user
/// to see and manipulate. Can be located in the navigationBar </summary>
struct SettingsView: View {
    @Environment(\.managedObjectContext) var viewContext
    @AppStorage("wordsCreated") var wordsCreated : Int?
    
    init() {
        // Making the styling fit the theme (overwriting apples own styling)
        UITableView.appearance().separatorStyle = .singleLine
        //UITableViewCell.appearance().backgroundColor = UIColor(Color("SecondaryColor"))
       UITableView.appearance().backgroundColor = UIColor(Color("PrimaryColor"))
    }
    
        @FetchRequest(sortDescriptors: [
        SortDescriptor(\.date)
    ]) var words: FetchedResults<Word>
    
    
    var body: some View {
        Form {
            Section {
                Text("Words translated \(String(wordsCreated ?? 0))")
                Text("Current recevoir \(String(words.count))")
            } header: {
                Text("Translation")
                    .foregroundColor(Color("SecondaryColor"))
                    .fontWeight(.heavy)
                    .font(.system(size: 18))
                    .offset(x:-12)
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
