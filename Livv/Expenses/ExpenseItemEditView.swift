//
//  ExpenseItemEditView.swift
//  Livv
//
//  Created by Akshit Deshpande on 2/26/23.
//

import SwiftUI

struct ExpenseItemEditView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var expenseItem: ExpenseItem
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Name")) {
                    TextField(expenseItem.name, text: $expenseItem.name)
                }
                
                Section(header: Text("Date")) {
                    DatePicker("", selection: $expenseItem.date, displayedComponents: [.date])
                }
                
                Section(header: Text("Cost")) {
                    TextField(expenseItem.cost.formatted(), value:
                                $expenseItem.cost, formatter: NumberFormatter())
                }
            }
            .navigationTitle("Edit Expense")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Done") {
                        self.presentationMode.wrappedValue.dismiss()
                    }
                }
                
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel", role: .cancel) {
                        self.presentationMode.wrappedValue.dismiss()
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct ExpenseItemEditView_Previews: PreviewProvider {
    static var previews: some View {
        ExpenseItemEditView(expenseItem: ExpenseItem(name: "Name", date: .distantFuture, cost: 11.11, payer: "User"))
    }
    
}
