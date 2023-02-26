//
//  InventoryAddItemForm.swift
//  Livv
//
//  Created by Pranav Burugula on 2/25/23.
//

import SwiftUI

struct InventoryAddItemForm: View {
    @State var newItemName: String = ""
    @State var newStatus: InventoryStatus = .STOCKED
    @State var newItemLocation: String
    let curGroups: [InventoryLocation]
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack(alignment: .leading) {
            Form {
                Section("Item Details") {
                    HStack {
                        TextField("Item name", text: $newItemName)
                        Spacer()
                        Menu {
                            Button {
                                newStatus = .STOCKED
                            } label: {
                                Image(systemName: "checkmark.circle")
                            }
                            
                            Button {
                                newStatus = .LOW
                            } label: {
                                Image(systemName: "exclamationmark.circle.fill").foregroundColor(.orange)
                            }
                            
                            Button {
                                newStatus = .OUT
                            } label: {
                                Image(systemName: "x.circle.fill").foregroundColor(.red)
                            }
                        } label: {
                            switch (newStatus) {
                            case .STOCKED:
                                Image(systemName: "checkmark.circle").foregroundColor(.primary)
                            case .LOW:
                                
                                Image(systemName: "exclamationmark.circle.fill").foregroundColor(.orange)
                            case .OUT:
                                Image(systemName: "x.circle.fill").foregroundColor(.red)
                            }
                        }
                    }
                    
                    Picker("Item location", selection: $newItemLocation) {
                        ForEach(curGroups) { group in
                            Text(group.name).tag(group.name)
                        }
                    }
                }
                
                Section {
                    Button("Add item") {
                        dismiss()
                    }.foregroundColor(.green)
                    
                    Button("Cancel") {
                        dismiss()
                    }.foregroundColor(.red)
                }
                
            }
        }.navigationTitle("Add Item")
    }
}

struct InventoryAddItemForm_Previews: PreviewProvider {
    static var previews: some View {
        InventoryAddItemForm(newItemLocation: InventoryLocation.samples[0].name, curGroups: InventoryLocation.samples)
    }
}
