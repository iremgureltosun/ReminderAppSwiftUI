//
//  ContentView.swift
//  RemindMe
//
//  Created by Tosun, Irem on 22.09.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            ReminderSettingsListView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }

            ReminderStatsView(icon: "calendar", title: "Today", count: 9)
                .tabItem {
                    Label("Reminders", systemImage: "calendar")
                }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
