//
//  ViewRouterController.swift
//  Chebravo
//
//  Created by Phillip Lundin on 22/07/2022.
//

import Foundation

// CaseIterable in order to style the NavigationBarView accordingly
// with proper padding
enum Page : CaseIterable {
    case Learn
    case YourWords
    case YourExamples
    case Settings
    
}

class ViewRouterController : ObservableObject {
    @Published var currentPage : Page = .YourWords
}
