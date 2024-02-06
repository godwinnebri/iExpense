//
//  Expenses.swift
//  iExpense
//
//  Created by Godwin IE on 20/10/2023.
//

///** COMMENTED BECAUSE I SWITCHED TO SWIFTDATA

//import Foundation
//
//class BusinessExpenses : ObservableObject {
//    @Published var items = [ExpenseItem]() {
//        didSet {
//            let encoder = JSONEncoder()
//            
//            if let encoded = try? encoder.encode(items) {
//                UserDefaults.standard.set(encoded, forKey: "BusinessItems")
//            }
//        }
//    }
//    
//    init() {
//        if let savedItems = UserDefaults.standard.data(forKey: "BusinessItems") {
//            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
//                items = decodedItems
//                return
//            }
//        }
//        
//        items = []
//    }
//}
