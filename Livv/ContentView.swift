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
                    Text("Calendar")
                }
            InventoryView()
                .tabItem{
                    Text("Inventory")
                }
            HomeView()
                .tabItem{
//                    Image(systemName: "HomeIcon")
                    Text("Home")
                }
            ChoreView()
                .tabItem{
                    Text("Chores")
                }
            ExpensesView()
                .tabItem{
                    Text("Expenses")
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
