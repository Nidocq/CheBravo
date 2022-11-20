//
//  SettingsView.swift
//  Chebravo
//
//  Created by Phillip Lundin on 23/07/2022.
//


//TODO: Make a credit page.
import SwiftUI

/// <summary> List the different option and information for the user
/// to see and manipulate. Can be located in the navigationBar </summary>
struct SettingsView: View {
    @Environment(\.managedObjectContext) var viewContext
    @AppStorage("wordsCreated") var wordsCreated : Int?
    @AppStorage("languageItalian") var languageItalian : Bool = false
    
    init() {
        // Making the styling fit the theme (overwriting apples own styling)
        UITableView.appearance().separatorStyle = .singleLine
        //UITableViewCell.appearance().backgroundColor = UIColor(Color("SecondaryColor"))
        UITableView.appearance().backgroundColor = .clear
        UITableView.appearance().backgroundColor = UIColor(Color("PrimaryColor"))
        
        let navBarAppearance = UINavigationBar.appearance()
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor(Color("SecondaryColor"))]
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor(Color("SecondaryColor"))]

        
    }
    
        @FetchRequest(sortDescriptors: [
        SortDescriptor(\.date)
    ]) var words: FetchedResults<Word>
    
    @State var Buttonhaha : Bool = false
    @State var isLanguageItalian : Bool = false
    
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("PrimaryColor")
                    .ignoresSafeArea()
                if #available(iOS 16.0, *) {
                    Form {
                        Section {
                            Text("Words translated \(String(wordsCreated ?? 0))")
                            Text("Words you know: \(String(words.count))")
                        } header: {
                            Text("Translation")
                                .foregroundColor(Color("SecondaryColor"))
                                .fontWeight(.heavy)
                                .font(.system(size: 18))
                                .offset(x:-12)
                        }
                        
                        Section {
                            Toggle("Switch language to Italian 🇮🇹", isOn: $languageItalian)
                            Toggle("Show translation on examples", isOn: $Buttonhaha)
                        } header: {
                            Text("Configuration")
                                .foregroundColor(Color("SecondaryColor"))
                                .fontWeight(.heavy)
                                .font(.system(size: 18))
                                .offset(x:-12)
                        }
                        Section {
                            Text("Version 1.0.0")
                        } header: {
                            Text("Translation")
                                .foregroundColor(Color("SecondaryColor"))
                                .fontWeight(.heavy)
                                .font(.system(size: 18))
                                .offset(x:-12)
                        }
                    }
                    .scrollContentBackground(.hidden)
                } else {
                  
                }
            }
            .navigationTitle("Settings")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
