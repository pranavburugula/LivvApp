//
//  InventoryView.swift
//  Livv
//
//  Created by Pranav Burugula on 2/25/23.
//

import SwiftUI

struct InventoryView: View {
    @State var inventory: [InventorySpace]
    @State var refresh: Bool = false
    var body: some View {
        NavigationStack {
            VStack {
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
                                            Image(systemName: "checkmark.circle.fill")
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
                                            Image(systemName: "checkmark.circle").foregroundColor(.black)
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
                }.navigationTitle("Inventory")
            }
        }
    }
}

struct InventoryView_Previews: PreviewProvider {
    static var previews: some View {
        InventoryView(inventory: InventorySpace.samples)
    }
}
