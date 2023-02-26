//
//  ChoreItemView.swift
//  Livv
//
//  Created by Akshit Deshpande on 2/25/23.
//

import SwiftUI

struct ChoreItemView: View {
    var choreItem: ChoreItem
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(choreItem.name)
                
                Spacer()
                
                Text(choreItem.assignee)
            }
            
            Text(choreItem.description)
            
            Text("Due " + choreItem.deadline.formatted(
                date: .numeric,
                time: .omitted))
        }
        .padding()
    }
}

struct ChoreItemView_Previews: PreviewProvider {
    static var previews: some View {
        ChoreItemView(choreItem: ChoreItem(choreId: 0, name: "Name", description: "Description", deadline: .distantFuture, assignee: "User", completed: false, repeating: false, repeatFrequency: 0))
    }
}
