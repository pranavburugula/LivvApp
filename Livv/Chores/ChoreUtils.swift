//
//  ChoreUtils.swift
//  Livv
//
//  Created by Akshit Deshpande on 2/26/23.
//

import Foundation

struct ChoreItem: Identifiable {
    var id = UUID()
    
    var choreId: Int
    
    var name: String
    var description: String
    var deadline: Date
    var assignee: String
    var completed: Bool
    
    var repeating: Bool
    var repeatFrequency: Int
}

func createRandomChoreItem() -> ChoreItem {
    let randomInt = Int.random(in: 1..<100)
    return ChoreItem(
        choreId: randomInt,
        name: "Chore " + randomInt.formatted(),
        description: "Description",
        deadline: .distantFuture,
        assignee: "User",
        completed: false,
        repeating: false,
        repeatFrequency: 0)
}

func createRandomChoreList() -> [ChoreItem] {
    var choreList: [ChoreItem] = []
    for _ in 1...5 {
        choreList.append(createRandomChoreItem())
    }
    return choreList
}

func createMockChoreList() -> [ChoreItem] {
    let todayDate = Date()
    return [
        ChoreItem(choreId: 0, name: "Take out Trash", description: "", deadline: Calendar.current.date(byAdding: .day, value: 3, to: todayDate)!, assignee: "Pranav", completed: false, repeating: false, repeatFrequency: 0),
        ChoreItem(choreId: 1, name: "Wash Dishes", description: "", deadline: Calendar.current.date(byAdding: .day, value: 4, to: todayDate)!, assignee: "Akshit", completed: false, repeating: false, repeatFrequency: 0),
        ChoreItem(choreId: 2, name: "Wipe Counters", description: "", deadline: Calendar.current.date(byAdding: .day, value: 5, to: todayDate)!, assignee: "Prithvi", completed: false, repeating: false, repeatFrequency: 0)
    ]
}
