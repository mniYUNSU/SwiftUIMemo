//
//  SwiftUIMemoApp.swift
//  SwiftUIMemo
//
//  Created by Comcom on 2023/07/21.
//

import SwiftUI

@main
struct SwiftUIMemoApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
