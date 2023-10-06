//
//  StoredRemindersListView.swift
//  RemindMe
//
//  Created by Tosun, Irem on 4.10.2023.
//

import SwiftData
import SwiftUI

struct ListReminderView: View {
    @Environment(\.modelContext) private var modelContext

    var body: some View {
        ListView(modelContext: modelContext)
    }

    private struct ListView: View {
        @StateObject var viewModel: ListReminderViewModel
        @State private var presentInsertReminder = false

        init(modelContext: ModelContext) {
            let viewModel = ListReminderViewModel(modelContext: modelContext)
            _viewModel = StateObject(wrappedValue: viewModel)
        }

        var body: some View {
            NavigationView {
                VStack {
                    reminderList
                        .onAppear {
                            viewModel.loadContext()
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
}

// #Preview {
//    ListReminderView()
//        .modelContainer(for: ReminderModel.self)
// }
