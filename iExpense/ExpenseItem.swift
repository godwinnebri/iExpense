//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Godwin IE on 20/10/2023.
//

import Foundation

struct ExpenseItem : Identifiable, Codable {
    var id = UUID()
    let name : String
    let type : String
    let amount : Double
}
