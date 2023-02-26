//
//  InventoryListView.swift
//  Livv
//
//  Created by Pranav Burugula on 2/25/23.
//

import SwiftUI

struct InventoryListView: View {
    @State var inventory: [InventoryLocation]
    @State var refresh: Bool = false
    
    var body: some View {
        List {
            ForEach(inventory) { inventorySpace in
                Section(inventorySpace.name) {
                    ForEach(inventorySpace.items) { inventoryItem in
                        HStack {
                            Text(inventoryItem.name)
                            Spacer()
                            Menu {
                                Button {
                                    inventoryItem.setStatus(newStatus: .STOCKED)
                                    refresh.toggle()
                                } label: {
                                    Image(systemName: "checkmark.circle")
                                }
                                
                                Button {
                                    inventoryItem.setStatus(newStatus: .LOW)
                                    refresh.toggle()
                                } label: {
                                    Image(systemName: "exclamationmark.circle.fill").foregroundColor(.orange)
                                }
                                
                                Button {
                                    inventoryItem.setStatus(newStatus: .OUT)
                                    refresh.toggle()
                                } label: {
                                    Image(systemName: "x.circle.fill").foregroundColor(.red)
                                }
                            } label: {
                                switch (inventoryItem.status) {
                                case .STOCKED:
                                    Image(systemName: "checkmark.circle").foregroundColor(.primary)
                                case .LOW:
                                    
                                    Image(systemName: "exclamationmark.circle.fill").foregroundColor(.orange)
                                case .OUT:
                                    Image(systemName: "x.circle.fill").foregroundColor(.red)
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

struct InventoryListView_Previews: PreviewProvider {
    static var previews: some View {
        InventoryListView(inventory: InventoryLocation.samples)
    }
}
