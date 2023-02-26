//
//  ChoreItemEditView.swift
//  Livv
//
//  Created by Akshit Deshpande on 2/25/23.
//

import SwiftUI

struct ChoreItemEditView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var choreItem: ChoreItem
    private let testUsers = ["User 1", "User 2", "User 3"]
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Name")) {
                    TextField(choreItem.name, text: $choreItem.name)
                }
                
                Section(header: Text("Description")) {
                    TextField(choreItem.description, text: $choreItem.description)
                }
                
                Section(header: Text("Deadline")) {
                    DatePicker("", selection: $choreItem.deadline, displayedComponents: [.date])
                }
                
                Section(header: Text("Assignee")) {
                    Picker("", selection: $choreItem.assignee) {
                        ForEach(testUsers, id: \.self) { testUser in
                            Text(testUser)
                        }
                    }
                }
                
                Section(header: Text("Does this chore repeat?")) {
                    Toggle("", isOn: $choreItem.repeating)
                }
                
                if choreItem.repeating {
                    Section(header: Text("Number of days until chore repeats")) {
                        TextField(choreItem.repeatFrequency.formatted(), value:
                                    $choreItem.repeatFrequency, formatter: NumberFormatter())
                    }
                }
            }
            .navigationTitle("Edit Chore")
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

struct ChoreItemEditView_Previews: PreviewProvider {
    static var previews: some View {
        ChoreItemEditView(choreItem: ChoreItem(choreId: 0, name: "Name", description: "Description", deadline: .distantFuture, assignee: "User", completed: false, repeating: false, repeatFrequency: 0))
    }
}
