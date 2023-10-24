//
//  PersonalExpenses.swift
//  iExpense
//
//  Created by Godwin IE on 24/10/2023.
//

import Foundation

class PersonalExpenses : ObservableObject {
    @Published var items = [ExpenseItem]() {
        didSet {
            let encoder = JSONEncoder()
            
            if let encoded = try? encoder.encode(items) {
                UserDefaults.standard.set(encoded, forKey: "PersonalItems")
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "PersonalItems") {
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
                items = decodedItems
                return
            }
        }
        
        items = []
    }
}

