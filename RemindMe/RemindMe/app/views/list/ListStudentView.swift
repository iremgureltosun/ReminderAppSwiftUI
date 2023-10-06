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
        @StateObject var viewModel: ListStudentViewModel
        @State private var presentInsertStudent: Bool = false

        init(modelContext: ModelContext) {
            let viewModel = ListStudentViewModel(modelContext: modelContext)
            _viewModel = StateObject(wrappedValue: viewModel)
        }

        var body: some View {
            NavigationView {
                VStack {
                    studentList
                        .onAppear {
                            viewModel.loadContext()
                            viewModel.loadItems()
                        }
                        .sheet(isPresented: $presentInsertStudent, onDismiss: {
                            viewModel.loadItems()
                        }, content: {
                            InsertStudentView()
                        })
                    Spacer()
                }
                .toolbar(content: {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("Add Student") {
                            presentInsertStudent = true
                        }
                    }
                })
            }
        }

        @ViewBuilder private var studentList: some View {
            List {
                ForEach(viewModel.list, id: \.id) { item in
                    HStack {
                        Text(item.title)
                            .foregroundColor(.blue)
                    }
                }
                .onDelete { index in
                    do {
                        try viewModel.delete(indexSet: index)
                    } catch {
                        debugPrint(error)
                    }
                }
            }
        }
    }
}

//#Preview {
//    ListStudentView()
//        .modelContainer(for: StudentModel.self)
//}
