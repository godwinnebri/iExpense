//
//  Expenses.swift
//  iExpense
//
//  Created by Godwin IE on 20/10/2023.
//

import Foundation

class Expenses : ObservableObject {
    @Published var items = [ExpenseItem]()
}
