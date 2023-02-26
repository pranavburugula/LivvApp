//
//  ExpensesView.swift
//  Livv
//
//  Created by Pranav Burugula on 2/25/23.
//

import SwiftUI

struct ExpenseItem: Identifiable {
    var id = UUID()
    
    var name: String
    var date: Date
    var cost: Float
    var payer: String
}

func createRandomExpenseItem() -> ExpenseItem {
    return ExpenseItem(
        name: "Expense " + Int.random(in: 1..<100).formatted(),
        date: .distantFuture,
        cost: Float(Int.random(in: 1..<10000)) / 100,
        payer: "User")
}

func createRandomExpenseList() -> [ExpenseItem] {
    var expenseList: [ExpenseItem] = []
    for _ in 1...5 {
        expenseList.append(createRandomExpenseItem())
    }
    return expenseList
}

struct ExpensesView: View {
    @State var expenseList: [ExpenseItem] = createRandomExpenseList()
    
    var body: some View {
        NavigationView {
            ScrollView() {
                Section(header: Text("Expenses")) {
                    ForEach(expenseList.indices) { i in
                            NavigationLink(destination:
                                            ExpenseItemEditView(expenseItem: expenseList[i])) {
                                ExpenseItemView(expenseItem: expenseList[i])
                            }
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Add") {
                    }
                }
            }
            .padding()
        }
    }
}

struct ExpensesView_Previews: PreviewProvider {
    static var previews: some View {
        ExpensesView()
    }
}
