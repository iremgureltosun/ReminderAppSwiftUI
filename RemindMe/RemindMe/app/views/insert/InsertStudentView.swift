//
//  InsertStudentView.swift
//  RemindMe
//
//  Created by Tosun, Irem on 5.10.2023.
//

import SwiftData
import SwiftUI

struct InsertStudentView: View {
    @Environment(\.modelContext) private var modelContext

    var body: some View {
        InsertView(modelContext: modelContext)
    }

    private struct InsertView: View {
        @StateObject var viewModel: InsertReminderViewModel

        init(modelContext: ModelContext) {
            let viewModel = InsertReminderViewModel(modelContext: modelContext)
            _viewModel = StateObject(wrappedValue: viewModel)
        }

        var body: some View {
            VStack(spacing: 15) {
                TextField("Enter student's name", text: $viewModel.title)
            }
            .alert(isPresented: $viewModel.showAlert) {
                Alert(
                    title: Text(Constants.Text.errorTitle),
                    message: Text(viewModel.errorMessage),
                    dismissButton: .default(Text(Constants.Text.okText))
                )
            }
            .alert(isPresented: $viewModel.showSuccess) {
                Alert(
                    title: Text(Constants.Text.successTitle),
                    message: Text(Constants.Text.successMessage),
                    dismissButton: .default(Text(Constants.Text.okText))
                )
            }
        }
    }
}

#Preview {
    InsertStudentView()
}
