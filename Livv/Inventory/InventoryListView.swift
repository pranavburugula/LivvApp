//
//  InventoryListView.swift
//  Livv
//
//  Created by Pranav Burugula on 2/25/23.
//

import SwiftUI

struct InventoryListView: View {
    @State var inventory: [InventoryItem]
    @State var locations: [InventoryLocation]
    @State var refresh: Bool = false
    @State var searchTerm: String = ""
    @State var filterImage: String = "line.3.horizontal.decrease.circle"
    @State var statusFilter: InventoryStatus = .STOCKED
    @State var useStatusFilter: Bool = false
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Menu {
                    Button {
                        filterImage = "line.3.horizontal.decrease.circle.fill"
                        statusFilter = .STOCKED
                        useStatusFilter = true
                    } label: {
                            Image(systemName: "checkmark.circle")
                    }
                    
                    Button {
                        filterImage = "line.3.horizontal.decrease.circle.fill"
                        statusFilter = .LOW
                        useStatusFilter = true
                    } label: {
                            Image(systemName: "exclamationmark.circle.fill")
                        
                    }
                    
                    Button {
                        filterImage = "line.3.horizontal.decrease.circle.fill"
                        statusFilter = .OUT
                        useStatusFilter = true
                    } label: {
                            Image(systemName: "x.circle.fill")
                        
                    }
                    
                    Button {
                        filterImage = "line.3.horizontal.decrease.circle"
                        useStatusFilter = false
                    } label: {
                        Text("Clear filters")
                            .multilineTextAlignment(.trailing)
                    }
                } label: {
                    Image(systemName: filterImage)
                } 
                
            }
            .padding(.trailing, 40)
            List {
                ForEach(locations) { inventorySpace in
                    Section(inventorySpace.name) {
                        ForEach(inventory.filter { item in
                            return (item.locationName.lowercased() == inventorySpace.name.lowercased()) && ((useStatusFilter && item.status == statusFilter) || !useStatusFilter)
                        }) { inventoryItem in
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
}

struct InventoryListView_Previews: PreviewProvider {
    static var previews: some View {
        InventoryListView(inventory: InventoryItem.allSamples, locations: InventoryLocation.samples)
    }
}
