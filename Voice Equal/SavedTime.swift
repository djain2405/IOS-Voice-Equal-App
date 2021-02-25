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
    
    @Published var totalMins: Int {
        didSet {
            UserDefaults.standard.set(totalMins, forKey: "totalMins")
        }
    }
    
    @Published var totalSecs: Int {
        didSet {
            UserDefaults.standard.set(totalSecs, forKey: "totalSecs")
        }
    }
    
    
    init() {
        self.womenMins = UserDefaults.standard.object(forKey: "womenMins") as? Int ?? 0
        self.menMins = UserDefaults.standard.object(forKey: "menMins") as? Int ?? 0
        self.womenSecs = UserDefaults.standard.object(forKey: "womenSecs") as? Int ?? 0
        self.menSecs = UserDefaults.standard.object(forKey: "menSecs") as? Int ?? 0
        self.totalMins = UserDefaults.standard.object(forKey: "totalMins") as? Int ?? 0
        self.totalSecs = UserDefaults.standard.object(forKey: "totalSecs") as? Int ?? 0
    }
}
