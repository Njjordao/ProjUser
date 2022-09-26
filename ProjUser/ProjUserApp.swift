//
//  ProjUserApp.swift
//  ProjUser
//
//  Created by user226748 on 9/19/22.
//

import SwiftUI


@main
struct ProjUserApp: App {
    let persistentcontainer = DataController.shareed
    var body: some Scene {
        WindowGroup {
            ContentView().environment(\.managedObjectContext, persistentcontainer.container.viewContext)
        }
    }
}
