//
//  ThemeColor.swift
//  Voice Equal
//
//  Created by Divya Jain on 2/24/21.
//

import Foundation
import SwiftUI


class ThemeColor: ObservableObject {
    private init() { }
    
    static let shared = ThemeColor()
  
    @Published var backgroundColor = Color("background")
}
