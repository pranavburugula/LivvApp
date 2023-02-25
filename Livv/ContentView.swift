//
//  ContentView.swift
//  Livv
//
//  Created by Pranav Burugula on 2/25/23.
//

import SwiftUI

struct ContentView: View {
    @State var curGroupName: String
    let allGroupNames: [GroupName]
    
    var body: some View {
        TabView {
            CalendarView()
                .tabItem{
                    Image(systemName: "calendar")
                }
            InventoryView()
                .tabItem{
                    Image(systemName: "refrigerator")
                }
            HomeView(curGroupName: curGroupName, allGroupNames: allGroupNames)
                .tabItem{
                    Image(systemName: "house")
                }
            ChoreView()
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
        ContentView(curGroupName: "My Home", allGroupNames: GroupName.sample)
    }
}

enum Pages {
    case HOME, INVENTORY
}
