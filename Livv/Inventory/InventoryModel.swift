//
//  InventoryModel.swift
//  Livv
//
//  Created by Pranav Burugula on 2/25/23.
//

import Foundation

struct InventoryModel {
    let spaces: [InventoryLocation]
    
}

struct InventoryLocation: Identifiable {
    let id = UUID()
    var name: String
    var items: [InventoryItem]
}

extension InventoryLocation {
    static var samples: [InventoryLocation] {
        [InventoryLocation(name: "Fridge", items: InventoryItem.fridgeSamples),
         InventoryLocation(name: "Under Sink", items: InventoryItem.sinkSamples)]
    }
}

class InventoryItem: Identifiable {
    let id = UUID()
    var name: String
    var status: InventoryStatus
    
    init(name: String, status: InventoryStatus) {
        self.name = name
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
        [InventoryItem(name: "Milk", status: InventoryStatus.LOW),
         InventoryItem(name: "Tomatoes", status: InventoryStatus.STOCKED),
         InventoryItem(name: "Eggs", status: InventoryStatus.OUT)]
    }
    
    static var sinkSamples: [InventoryItem] {
        [InventoryItem(name: "Dish Soap", status: InventoryStatus.LOW),
         InventoryItem(name: "Surface Cleaner", status: InventoryStatus.STOCKED),
         InventoryItem(name: "Paper Towels", status: InventoryStatus.OUT)]
    }
}
