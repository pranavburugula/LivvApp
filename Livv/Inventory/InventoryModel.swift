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
}

extension InventoryLocation {
    static var samples: [InventoryLocation] {
        [InventoryLocation(name: "Fridge"),
         InventoryLocation(name: "Under Sink")]
    }
}

class InventoryItem: Identifiable {
    let id = UUID()
    var name: String
    var status: InventoryStatus
    var locationId: UUID = UUID()
    var locationName: String
    
    init(name: String, status: InventoryStatus, locationName: String) {
        self.name = name
        self.status = status
        self.locationName = locationName
    }
    
    func setStatus (newStatus: InventoryStatus) {
        status = newStatus
    }
}

enum InventoryStatus {
    case STOCKED, LOW, OUT
}

extension InventoryItem {
    static var allSamples: [InventoryItem] {
        fridgeSamples + sinkSamples
    }
    
    static var fridgeSamples: [InventoryItem] {
        [InventoryItem(name: "Milk", status: InventoryStatus.LOW, locationName: InventoryLocation.samples[0].name),
         InventoryItem(name: "Tomatoes", status: InventoryStatus.STOCKED, locationName: InventoryLocation.samples[0].name),
         InventoryItem(name: "Eggs", status: InventoryStatus.OUT, locationName: InventoryLocation.samples[0].name)]
    }
    
    static var sinkSamples: [InventoryItem] {
        [InventoryItem(name: "Dish Soap", status: InventoryStatus.LOW, locationName: InventoryLocation.samples[1].name),
         InventoryItem(name: "Surface Cleaner", status: InventoryStatus.STOCKED, locationName: InventoryLocation.samples[1].name),
         InventoryItem(name: "Paper Towels", status: InventoryStatus.OUT, locationName: InventoryLocation.samples[1].name)]
    }
}
