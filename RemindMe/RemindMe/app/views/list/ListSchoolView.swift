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

        init(modelContext: ModelContext) {
            let viewModel = ListSchoolViewModel(modelContext: modelContext)
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
    ListSchoolView()
        .modelContainer(for: SchoolModel.self)
}
