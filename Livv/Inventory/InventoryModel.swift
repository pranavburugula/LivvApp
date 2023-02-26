//
//  InventoryModel.swift
//  Livv
//
//  Created by Pranav Burugula on 2/25/23.
//

import Foundation

struct InventoryModel {
    let spaces: [InventorySpace]
    
}

struct InventorySpace: Identifiable {
    let id = UUID()
    var name: String
    var items: [InventoryItem]
}

extension InventorySpace {
    static var samples: [InventorySpace] {
        [InventorySpace(name: "Fridge", items: InventoryItem.fridgeSamples),
         InventorySpace(name: "Under Sink", items: InventoryItem.sinkSamples)]
    }
}

class InventoryItem: Identifiable {
    let id = UUID()
    var name: String
    var quantity: Int
    var status: InventoryStatus
    
    init(name: String, quantity: Int, status: InventoryStatus) {
        self.name = name
        self.quantity = quantity
        self.status = status
    }
    
    func setStatus (newStatus: InventoryStatus) {
        status = newStatus
    }
}

enum InventoryStatus {
    case STOCKED, LOW, OUT
}

extension InventoryItem {
    static var fridgeSamples: [InventoryItem] {
        [InventoryItem(name: "Milk", quantity: 1, status: InventoryStatus.LOW),
         InventoryItem(name: "Tomatoes", quantity: 3, status: InventoryStatus.STOCKED),
         InventoryItem(name: "Eggs", quantity: 12, status: InventoryStatus.OUT)]
    }
    
    static var sinkSamples: [InventoryItem] {
        [InventoryItem(name: "Dish Soap", quantity: 1, status: InventoryStatus.LOW),
         InventoryItem(name: "Surface Cleaner", quantity: 1, status: InventoryStatus.STOCKED),
         InventoryItem(name: "Paper Towels", quantity: 8, status: InventoryStatus.OUT)]
    }
}
