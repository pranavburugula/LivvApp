//
//  ChoresView.swift
//  Livv
//
//  Created by Pranav Burugula on 2/25/23.
//

import SwiftUI

struct ChoresView: View {
    @State var choreList: [ChoreItem] = createMockChoreList()

        var body: some View {
            NavigationStack {
                ScrollView() {
                    Section() {
                        ForEach(choreList.indices) { i in
                            GroupBox {
                                HStack {
                                    Toggle("", isOn: $choreList[i].repeating).labelsHidden()
                                    
                                    NavigationLink(destination:
                                                    ChoreItemEditView(choreItem: choreList[i])) {
                                        ChoreItemView(choreItem: choreList[i])
                                    }
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
            .navigationTitle("Chores")
        }
    }
}

struct ChoresView_Previews: PreviewProvider {
    static var previews: some View {
        ChoresView()
    }
}
