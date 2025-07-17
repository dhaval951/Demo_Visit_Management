//
//  iOS_Visit_Management_AppApp.swift
//  iOS Visit Management App
//
//  Created by Dhaval Bhadania on 16/07/25.
//

import SwiftUI

@main
struct iOS_Visit_Management_AppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: MyData.self)

        }
    }
}
