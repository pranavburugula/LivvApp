//
//  ExpenseUtils.swift
//  Livv
//
//  Created by Akshit Deshpande on 2/26/23.
//

import Foundation

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

func createMockExpenseList() -> [ExpenseItem] {
    let todayDate = Date()
    return [
        ExpenseItem(name: "Groceries", date: todayDate, cost: 20.42, payer: "Prithvi"),
        ExpenseItem(name: "Paper Towels", date: Calendar.current.date(byAdding: .day, value: 1, to: todayDate)!, cost: 7.31, payer: "Akshit"),
        ExpenseItem(name: "Dish soap", date: Calendar.current.date(byAdding: .day, value: 2, to: todayDate)!, cost: 4.87, payer: "Ayush")
    ]
}
