//
//  ContentView.swift
//  iExpense
//
//  Created by Godwin IE on 17/10/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var expenses = Expenses()
    
    var body: some View {
        
        NavigationView {
            List {
                ForEach (expenses.items, id: \.name) { item in
                    Text(item.name)
                }
                .onDelete(perform: removeItems)
            } //list
            .navigationTitle("iExpense")
            .toolbar {
                Button {
                    let expense = ExpenseItem(name: "test \(expenses.items.count)", type: "personal", amount: 99)
                    expenses.items.append(expense)
                } label: {
                    Image(systemName: "plus")
                }
            }

        }
    }
    
    func removeItems (at offset : IndexSet) {
        expenses.items.remove(atOffsets: offset)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
