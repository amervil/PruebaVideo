//
//  PruebaVideoApp.swift
//  PruebaVideo
//
//  Created by Americo Villalva on 6/7/23.
//

import SwiftUI

@main
struct PruebaVideoApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
