//
//  iExpenseApp.swift
//  iExpense
//
//  Created by Godwin IE on 17/10/2023.
//

import SwiftData
import SwiftUI

@main
struct iExpenseApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: ExpenseItem.self)
    }
}
