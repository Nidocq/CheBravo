//
//  ViewRouterController.swift
//  Chebravo
//
//  Created by Phillip Lundin on 22/07/2022.
//

import Foundation

enum Page {
    case Learn
    case YourWords
    case YourExamples
    
}

class ViewRouterController : ObservableObject {
    @Published var currentPage : Page = .YourWords
}
