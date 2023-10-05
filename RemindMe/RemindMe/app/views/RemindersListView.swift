//
//  StoredRemindersListView.swift
//  RemindMe
//
//  Created by Tosun, Irem on 4.10.2023.
//

import SwiftData
import SwiftUI

struct RemindersListView: View {
    @Environment(\.modelContext) private var modelContext

    var body: some View {
        ListView(modelContext: modelContext)
    }

    private struct ListView: View {
        @StateObject var viewModel: RemindersListViewModel

        init(modelContext: ModelContext) {
            let viewModel = RemindersListViewModel(modelContext: modelContext)
            _viewModel = StateObject(wrappedValue: viewModel)
        }

        var body: some View {
            List {
                ForEach(viewModel.list, id: \.id) { item in

                    HStack {
                        Text(item.name)
                            .foregroundColor(.blue)
                    }
                }
            }
            .onAppear {
                viewModel.loadItems()
            }
        }
    }
}

#Preview {
    RemindersListView()
        .modelContainer(for: ReminderModel.self)
}
