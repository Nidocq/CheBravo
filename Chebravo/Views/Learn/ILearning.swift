//
//  ILearning.swift
//  Chebravo
//
//  Created by Phillip Lundin on 23/07/2022.
//

import Foundation
import SwiftUI


// Learning Material Views
protocol ILearning : View, Identifiable {
    var id : UUID { get }
}
