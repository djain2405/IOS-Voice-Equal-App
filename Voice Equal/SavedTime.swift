//
//  SavedTime.swift
//  Voice Equal
//
//  Created by Divya Jain on 2/21/21.
//

import Foundation

class SavedTime: ObservableObject {
    @Published var womenMins: Int {
        didSet {
            UserDefaults.standard.set(womenMins, forKey: "womenMins")
        }
    }
    
    @Published var womenSecs: Int {
        didSet {
            UserDefaults.standard.set(womenSecs, forKey: "womenSecs")
        }
    }
    
    @Published var menMins: Int {
        didSet {
            UserDefaults.standard.set(menMins, forKey: "menMins")
        }
    }
    
    @Published var menSecs: Int {
        didSet {
            UserDefaults.standard.set(menSecs, forKey: "menSecs")
        }
    }
    
    
    init() {
        self.womenMins = UserDefaults.standard.object(forKey: "womenMins") as? Int ?? 0
        self.menMins = UserDefaults.standard.object(forKey: "menMins") as? Int ?? 0
        self.womenSecs = UserDefaults.standard.object(forKey: "womenSecs") as? Int ?? 0
        self.menSecs = UserDefaults.standard.object(forKey: "menSecs") as? Int ?? 0
    }
}
