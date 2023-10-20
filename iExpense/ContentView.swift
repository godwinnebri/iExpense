//
//  ContentView.swift
//  iExpense
//
//  Created by Godwin IE on 17/10/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var expenses = Expenses()
    
    @State private var showAddExpense = false
    
    var body: some View {
        
        NavigationView {
            List {
                ///id is removed because the expense item struct
                ///conforms to Identifiable and has an id variable(UUID)
                ForEach (expenses.items) { item in
                    Text(item.name)
                }
                .onDelete(perform: removeItems)
            } //list
            .navigationTitle("iExpense")
            .toolbar {
                Button {
                   showAddExpense = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showAddExpense) {
                AddView(expenses: expenses)
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
