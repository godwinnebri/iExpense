//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Godwin IE on 20/10/2023.
//

import Foundation
import SwiftData

@Model
class ExpenseItem{
    var id = UUID()
    let name : String
    let type : String
    let amount : Double
    
    init(id: UUID = UUID(), name: String, type: String, amount: Double) {
        self.id = id
        self.name = name
        self.type = type
        self.amount = amount
    }
}
