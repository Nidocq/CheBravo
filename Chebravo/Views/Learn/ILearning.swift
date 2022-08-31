//
//  ILearning.swift
//  Chebravo
//
//  Created by Phillip Lundin on 23/07/2022.
//

import Foundation
import SwiftUI


/// <summary> Couples all the learning material together to make
/// it easier to work with in the future as well </summary>
protocol ILearning : View, Identifiable {
    var id : UUID { get }
    static var MATERIAL_TITLE : String { get }
    static var ICON_NAME : String { get }
}
