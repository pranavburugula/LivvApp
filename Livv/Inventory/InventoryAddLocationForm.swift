//
//  InventoryAddSpaceForm.swift
//  Livv
//
//  Created by Pranav Burugula on 2/25/23.
//

import SwiftUI

struct InventoryAddLocationForm: View {
    @State var newLocationName: String = ""
    var body: some View {
        Form {
            Section("Location details") {
                TextField("Location name", text: $newLocationName)
            }
            
            Section {
                Button("Create Location") {
                    
                }.foregroundColor(.green)
                
                Button("Cancel") {
                    
                }.foregroundColor(.red)
            }
        }.navigationTitle("Add Location")
    }
}

struct InventoryAddSpaceForm_Previews: PreviewProvider {
    static var previews: some View {
        InventoryAddLocationForm()
    }
}
