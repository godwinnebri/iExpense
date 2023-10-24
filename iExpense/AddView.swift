//
//  AddView.swift
//  iExpense
//
//  Created by Godwin IE on 20/10/2023.
//

import SwiftUI

struct AddView: View {
    @ObservedObject var personalExpense : PersonalExpenses
    @ObservedObject var businessExpense : BusinessExpenses
    
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = 0.0
    
    let types = ["Business", "Personal"]
    
    /// to dismiss sheet
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            Form {
               TextField("Name", text: $name)
                
                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
                
                TextField("Amount", value: $amount, format: .currency(code: "USD"))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("Add expense")
            .toolbar {
                Button{
                    let expense = ExpenseItem(name: name, type: type, amount: amount)
                    type == "Personal" ? personalExpense.items.append(expense) : businessExpense.items.append(expense)
                    dismiss()
                } label: {
                    Text("Save")
                }
            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(personalExpense: PersonalExpenses(), businessExpense: BusinessExpenses())
    }
}
