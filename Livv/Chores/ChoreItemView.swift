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
        HStack() {
                    VStack(alignment: .leading) {
                        Text(choreItem.name)
                        Text(choreItem.description)

                        Text("Due " + choreItem.deadline.formatted(
                            date: .numeric,
                            time: .omitted))

                    }

                    Spacer()

                    VStack {
                        Image(systemName: "person.circle.fill")
                        Text(choreItem.assignee)
                    }
        }
        .padding()
    }
}

struct ChoreItemView_Previews: PreviewProvider {
    static var previews: some View {
        ChoreItemView(choreItem: ChoreItem(choreId: 0, name: "Name", description: "Description", deadline: .distantFuture, assignee: "User", completed: false, repeating: false, repeatFrequency: 0))
    }
}
