//
//  ExpensesView.swift
//  Livv
//
//  Created by Pranav Burugula on 2/25/23.
//

import SwiftUI


struct ExpensesView: View {
    @State var expenseList: [ExpenseItem] = createMockExpenseList()

        var body: some View {
            NavigationStack {
                ScrollView() {
                    Section() {
                        ForEach(expenseList.indices) { i in
                            GroupBox {
                                NavigationLink(destination:
                                                ExpenseItemEditView(expenseItem: expenseList[i])) {
                                    ExpenseItemView(expenseItem: expenseList[i])
                                }
                            }
                        }
                }.foregroundColor(.primary)
            }
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Add") {
                    }
                }
            }
            .padding()
            .navigationTitle("Expenses")
        }
    }
}

struct ExpensesView_Previews: PreviewProvider {
    static var previews: some View {
        ExpensesView()
    }
}
