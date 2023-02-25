//
//  LivvApp.swift
//  Livv
//
//  Created by Pranav Burugula on 2/25/23.
//

import SwiftUI

@main
struct LivvApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView_example()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
