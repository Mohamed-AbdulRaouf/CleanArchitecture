//
//  CleanArchitectureApp.swift
//  CleanArchitecture
//
//  Created by mohamed on 7/20/22.
//

import SwiftUI

@main
struct CleanArchitectureApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
