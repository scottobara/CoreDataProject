//
//  CoreDataProjectApp.swift
//  CoreDataProject
//
//  Created by Scott Obara on 10/2/21.
//

import SwiftUI
import CoreData

@main
struct CoreDataProjectApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
