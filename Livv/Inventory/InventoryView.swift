//
//  InventoryView.swift
//  Livv
//
//  Created by Pranav Burugula on 2/25/23.
//

import SwiftUI

struct InventoryView: View {
    @State var inventory: [InventoryItem]
    @State var locations: [InventoryLocation]
    @State var refresh: Bool = false
    @State var searchTerm: String = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                InventoryListView(inventory: inventory, locations: locations)
                .toolbar {
                    Menu {
                        NavigationLink("Add item", destination: InventoryAddItemForm(newItemLocation: inventory[0].name, curGroups: locations))
                        
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
        InventoryView(inventory: InventoryItem.allSamples, locations: InventoryLocation.samples)
    }
}

enum InventoryAddDest {
case ITEM, SPACE
}
