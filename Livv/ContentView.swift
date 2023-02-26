//
//  ContentView.swift
//  Livv
//
//  Created by Pranav Burugula on 2/25/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            CalendarView()
                .tabItem{
                    Image(systemName: "calendar")
                }
            InventoryView(inventory: InventoryItem.allSamples, locations: InventoryLocation.samples)
                .tabItem{
                    Image(systemName: "refrigerator")
                }
            HomeView()
                .tabItem{
                    Image(systemName: "house")
                }
            ChoresView()
                .tabItem{
                    Image(systemName: "checklist")
                }
            ExpensesView()
                .tabItem{
                    Image(systemName: "dollarsign")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

enum Pages {
    case HOME, INVENTORY
}
