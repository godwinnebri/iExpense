//
//  AddView.swift
//  iExpense
//
//  Created by Godwin IE on 20/10/2023.
//

import SwiftUI
import SwiftData

struct AddView: View {
    @Environment(\.modelContext) var modelContext
    
    @State private var name = "Enter expense name"
    @State private var type = "Personal"
    @State private var amount = 0.0
    
    let types = ["Business", "Personal"]
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            Form {
              // TextField("Name", text: $name)
                
                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
                
                TextField("Amount", value: $amount, format: .currency(code: "USD"))
                    .keyboardType(.decimalPad)
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle($name)
            .toolbar {
                Button{
                    let expense = ExpenseItem(name: name, type: type, amount: amount)
                    modelContext.insert(expense)
                    dismiss()
                } label: {
                    Text("Save")
                }
            }
        }
        .navigationBarBackButtonHidden()

    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView()
    }
}
