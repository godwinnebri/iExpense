//
//  ContentView.swift
//  iExpense
//
//  Created by Godwin IE on 17/10/2023.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @State private var type = "Business"
    let types = ["Business", "Personal"]
    
    @Environment(\.modelContext) var modelContext
    @Query(filter: #Predicate<ExpenseItem>{ expense in
        
        // this filter will only show you "Business" expenses
        if expense.type == "Business" {
            return true
        } else {
            return false
        }
        
    },
        sort: [
        SortDescriptor(\ExpenseItem.name),
        SortDescriptor(\ExpenseItem.amount)
    ]) var expenses : [ExpenseItem]
    
    @State private var showAddExpense = false
    
    let userCurrency : FloatingPointFormatStyle<Double>.Currency = .currency(code: Locale.current.currency?.identifier ?? "NGN")

    var body: some View {
        
        NavigationStack {
            List {
                
                // this filter does not work because
                // i have not found a way to make predicate filtering work dynamically
                Picker("Filter by", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
                    
                    ForEach (expenses) { expense in
                        HStack {
                            VStack (alignment: .leading) {
                                Text(expense.name)
                                    .font(.headline)
                                Text(expense.type)
                            }
                            
                            Spacer()
                            
                            Text(expense.amount, format: userCurrency)
                                .foregroundColor({
                                    if expense.amount <= 10 {
                                        return Color.green
                                    } else if expense.amount <= 100 {
                                        return Color.orange
                                    } else {
                                        return Color.red
                                    }
                                }())
                        }
                    }
                    .onDelete(perform: removeExpense)
                                    
            } //list
            .navigationTitle("iExpense")
            .toolbar {
                
                Button {
                    showAddExpense = true
                } label: {
                    Image(systemName: "plus")
                }
                
                .sheet(isPresented: $showAddExpense) {
                    AddView()
                }
                
            }
            
            } //nav stack
        }
        
        func removeExpense(at offsets: IndexSet) {
            for index in offsets {
                let expense = expenses[index]
                modelContext.delete(expense)
            }
        }

        
    }

    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }

