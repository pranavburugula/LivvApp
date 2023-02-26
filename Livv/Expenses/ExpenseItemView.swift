//
//  ExpenseItemView.swift
//  Livv
//
//  Created by Akshit Deshpande on 2/26/23.
//

import SwiftUI

struct ExpenseItemView: View {
    var expenseItem: ExpenseItem
    
    var body: some View {
        VStack {
            HStack {
                Text(expenseItem.date.formatted(
                    date: .numeric,
                    time: .omitted))
                
                Spacer()
                
                Text(expenseItem.name)
            }
            
            HStack {
                Text(expenseItem.payer)
                
                Spacer()
                
                Text("$" + expenseItem.cost.formatted())
            }
        }
        .padding()
    }
}

struct ExpenseItemView_Previews: PreviewProvider {
    static var previews: some View {
        ExpenseItemView(expenseItem: ExpenseItem(name: "Name", date: .distantFuture, cost: 11.11, payer: "User"))
    }
}
