//
//  SwiftUIMemoApp.swift
//  SwiftUIMemo
//
//  Created by Comcom on 2023/07/21.
//

import SwiftUI

@main
struct SwiftUIMemoApp: App {
    @StateObject var store = MemoStore()
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            MainListView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext).environmentObject(store)
        }
    }
}
