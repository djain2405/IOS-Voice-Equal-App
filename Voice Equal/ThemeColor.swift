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
    @Published var textColor = Color(.black)
    @Published var resultButton = Color("background")
    @Published var womenCounterTextColor = Color(.black)
    @Published var menCounterTextColor = Color(.black)
    @Published var buttonTint = Color(.gray)
}

extension UserDefaults {
    static func resetDefaults() {
        if let bundleID = Bundle.main.bundleIdentifier {
            UserDefaults.standard.removePersistentDomain(forName: bundleID)
        }
    }
}
