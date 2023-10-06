//
//  ListSchoolView.swift
//  RemindMe
//
//  Created by Tosun, Irem on 6.10.2023.
//

import Foundation
import SwiftData
import SwiftUI

struct ListSchoolView: View {
    @Environment(\.modelContext) private var modelContext

    var body: some View {
        ListView(modelContext: modelContext)
    }

    private struct ListView: View {
        @StateObject var viewModel: ListSchoolViewModel
        @State private var presentInsertSchool: Bool = false

        init(modelContext: ModelContext) {
            let viewModel = ListSchoolViewModel(modelContext: modelContext)
            _viewModel = StateObject(wrappedValue: viewModel)
        }

        var body: some View {
            NavigationView {
                VStack {
                    schoolList
                        .onAppear {
                            viewModel.loadContext()
                            viewModel.loadItems()
                        }
                        .sheet(isPresented: $presentInsertSchool, onDismiss: {
                            viewModel.loadItems()
                        }, content: {
                            InsertSchoolView()
                        })
                    Spacer()
                }
                .toolbar(content: {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("Add School") {
                            presentInsertSchool = true
                        }
                    }
                })
            }
        }

        @ViewBuilder private var schoolList: some View {
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
