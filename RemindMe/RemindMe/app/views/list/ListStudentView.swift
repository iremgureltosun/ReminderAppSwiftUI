//
//  ListStudentView.swift
//  RemindMe
//
//  Created by Tosun, Irem on 5.10.2023.
//

import SwiftData
import SwiftUI

struct ListStudentView: View {
    @Environment(\.modelContext) private var modelContext

    var body: some View {
        ListView(modelContext: modelContext)
    }

    private struct ListView: View {
        @StateObject var viewModel: ListReminderViewModel

        init(modelContext: ModelContext) {
            let viewModel = ListReminderViewModel(modelContext: modelContext)
            _viewModel = StateObject(wrappedValue: viewModel)
        }

        var body: some View {
            List {
                ForEach(viewModel.list, id: \.id) { item in

                    HStack {
                        Text(item.title)
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
    ListStudentView()
        .modelContainer(for: StudentModel.self)
}
