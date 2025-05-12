//
//  Habits.swift
//  Habitrac
//
//  Created by Ino Yang Popper on 5/12/25.
//

import SwiftUI
import Foundation

@Observable
class Habits {
    var items = [Habit]() {
        
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? JSONDecoder().decode([Habit].self, from: savedItems) {
                items = decodedItems
                return
            }
        }
        items = []
    }
}
