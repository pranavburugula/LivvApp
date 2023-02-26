//
//  InventoryView.swift
//  Livv
//
//  Created by Pranav Burugula on 2/25/23.
//

import SwiftUI

struct InventoryView: View {
    @State var inventory: [InventoryLocation]
    @State var refresh: Bool = false
    var body: some View {
        NavigationStack {
            VStack {
                InventoryListView(inventory: inventory)
                .toolbar {
                    Menu {
                        NavigationLink("Add item", destination: InventoryAddItemForm(newItemLocation: inventory[0].name, curGroups: inventory))
                        
                        NavigationLink("Add location group", destination: InventoryAddLocationForm())
                    } label: {
                        Image(systemName: "plus")
                    }
                }
                .navigationTitle("Inventory")
            }
        }
    }
}

struct InventoryView_Previews: PreviewProvider {
    static var previews: some View {
        InventoryView(inventory: InventoryLocation.samples)
    }
}

enum InventoryAddDest {
case ITEM, SPACE
}
