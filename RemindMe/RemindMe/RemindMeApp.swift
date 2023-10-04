//
//  RemindMeApp.swift
//  RemindMe
//
//  Created by Tosun, Irem on 22.09.2023.
//

import SwiftUI
import SwiftData

@main
struct RemindMeApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ContentView()
            }
        }.modelContainer(for: [ReminderModel.self])
    }
}
