//
//  StoredRemindersListView.swift
//  RemindMe
//
//  Created by Tosun, Irem on 4.10.2023.
//

import SwiftData
import SwiftUI

struct ListReminderView: View {
        @StateObject var viewModel: ListReminderViewModel
        @State private var presentInsertReminder = false

        init() {
            let viewModel = ListReminderViewModel()
            _viewModel = StateObject(wrappedValue: viewModel)
        }

        var body: some View {
            NavigationView {
                VStack {
                    reminderList
                        .onAppear {
                            viewModel.loadItems()
                        }
                        .sheet(isPresented: $presentInsertReminder, onDismiss: {
                            viewModel.loadItems()
                        }, content: {
                            InsertReminderView()
                        })
                    Spacer()
                }
                .toolbar(content: {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("Add Reminder") {
                            presentInsertReminder = true
                        }
                    }
                })
            }
        }

        @ViewBuilder private var reminderList: some View {
            List {
                ForEach(viewModel.list, id: \.id) { item in

                    HStack {
                        Text(item.title)
                            .foregroundColor(.blue)
                    }
                }
            }
        }
    
}

 #Preview {
    ListReminderView()
        .modelContainer(for: ReminderModel.self)
 }
