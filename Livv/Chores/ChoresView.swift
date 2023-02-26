//
//  ChoresView.swift
//  Livv
//
//  Created by Pranav Burugula on 2/25/23.
//

import SwiftUI

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

struct ChoresView: View {
    @State var choreList: [ChoreItem] = createRandomChoreList()
    
    var body: some View {
        NavigationView {
            ScrollView() {
                Section(header: Text("My Chores")) {
                    ForEach(choreList.indices) { i in
                        HStack {
                            Toggle("", isOn: $choreList[i].repeating).labelsHidden()
                            
                            NavigationLink(destination:
                                            ChoreItemEditView(choreItem: choreList[i])) {
                                ChoreItemView(choreItem: choreList[i])
                            }
                        }
                    }
                }
                
                Section(header: Text("All Chores")) {
                    
                    ForEach(choreList) { choreItem in
                        NavigationLink(destination:
                                        ChoreItemEditView(choreItem: choreItem)) {
                            ChoreItemView(choreItem: choreItem)
                            
                        }
                    }
                }
                
            
                Section {
                    Text("Completed Chores")
                    ForEach(choreList) { choreItem in
                        NavigationLink(destination:
                                        ChoreItemEditView(choreItem: choreItem)) {
                            ChoreItemView(choreItem: choreItem)
                            
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

struct ChoresView_Previews: PreviewProvider {
    static var previews: some View {
        ChoresView()
    }
}
