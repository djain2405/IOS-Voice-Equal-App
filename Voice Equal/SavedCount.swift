//
//  SavedCount.swift
//  Voice Equal
//
//  Created by Divya Jain on 2/14/21.
//

import Foundation

class SavedCount: ObservableObject {
    @Published var womenCount: String {
        didSet {
            UserDefaults.standard.set(womenCount, forKey: "womenCount")
        }
    }
    
    @Published var menCount: String {
        didSet {
            UserDefaults.standard.set(menCount, forKey: "menCount")
        }
    }
    
    init() {
        self.womenCount = UserDefaults.standard.object(forKey: "womenCount") as? String ?? ""
        self.menCount = UserDefaults.standard.object(forKey: "menCount") as? String ?? ""
    }
}
