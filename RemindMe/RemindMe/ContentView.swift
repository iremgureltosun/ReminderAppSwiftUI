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
//            InsertReminderView()
//                .tabItem {
//                    Label("Add Reminder", systemImage: "gear")
//                }

            // ReminderStatsView(icon: "calendar", title: "Today", count: 9)
            ListReminderView()
                .tabItem {
                    Label("Reminders", systemImage: "calendar")
                }

            ListStudentView()
                .tabItem {
                    Label("Students", systemImage: "user")
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
