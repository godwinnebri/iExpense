//
//  ContentView.swift
//  iExpense
//
//  Created by Godwin IE on 17/10/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var personalExpenses = PersonalExpenses()
    @StateObject var businessExpenses = BusinessExpenses()
    
    @State private var showAddExpense = false
    
    
    
    let userCurrency : FloatingPointFormatStyle<Double>.Currency = .currency(code: Locale.current.currency?.identifier ?? "NGN")
    
    var body: some View {
        
        NavigationStack {
            List {
                Section {
                    DisclosureGroup ("Personal") {
                        ///id is removed because the expense item struct
                        ///conforms to Identifiable and has an id variable(UUID)\
                        ForEach (personalExpenses.items) { item in
                            HStack {
                                VStack (alignment: .leading) {
                                    Text(item.name)
                                        .font(.headline)
                                    Text(item.type)
                                }
                                
                                Spacer()
                                
                                Text(item.amount, format: userCurrency)
                                    .foregroundColor({
                                        if item.amount <= 10 {
                                            return Color.green
                                        } else if item.amount <= 100 {
                                            return Color.orange
                                        } else {
                                            return Color.red
                                        }
                                    }())
                            }
                        }
                        .onDelete(perform: removePersonalItem)
                    }
                }
                
                Section {
                    DisclosureGroup ("Business") {
                        ForEach (businessExpenses.items) { item in
                            HStack {
                                VStack (alignment: .leading) {
                                    Text(item.name)
                                        .font(.headline)
                                    Text(item.type)
                                }
                                
                                Spacer()
                                
                                Text(item.amount, format: userCurrency)
                                    .foregroundColor({
                                        if item.amount <= 10 {
                                            return Color.green
                                        } else if item.amount <= 100 {
                                            return Color.orange
                                        } else {
                                            return Color.red
                                        }
                                    }())
                            }
                        }
                        .onDelete(perform: removeBusinessItem)
                    }
                }
            } //list
            .navigationTitle("iExpense")
            .toolbar {
                
                NavigationLink {
                    AddView(personalExpense: personalExpenses, businessExpense: businessExpenses)
                } label: {
                    Image(systemName: "plus")
                }
//                Button {
//                   showAddExpense = true
//                } label: {
//                    Image(systemName: "plus")
//                }
            }
//            .sheet(isPresented: $showAddExpense) {
//                AddView(personalExpense: personalExpenses, businessExpense: businessExpenses)
//            }

        }
    }
    
    func removePersonalItem (at offset : IndexSet) {
        personalExpenses.items.remove(atOffsets: offset)
    }
    
    func removeBusinessItem (at offset : IndexSet) {
        businessExpenses.items.remove(atOffsets: offset)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
