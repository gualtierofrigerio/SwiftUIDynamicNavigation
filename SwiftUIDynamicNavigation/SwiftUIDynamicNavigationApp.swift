//
//  SwiftUIDynamicNavigationApp.swift
//  SwiftUIDynamicNavigation
//
//  Created by Gualtiero Frigerio on 27/02/21.
//

import SwiftUI

@main
struct SwiftUIDynamicNavigationApp: App {
    let coordinator = Coordinator()
    
    var body: some Scene {
        WindowGroup {
            ContentView(coordinator: coordinator)
        }
    }
}
