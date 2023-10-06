//
//  InsertSchoolView.swift
//  RemindMe
//
//  Created by Tosun, Irem on 6.10.2023.
//

import SwiftData
import SwiftUI

struct InsertSchoolView: View {
    @Environment(\.modelContext) private var modelContext

    var body: some View {
        InsertView(modelContext: modelContext)
    }

    private struct InsertView: View {
        @StateObject var viewModel: InsertSchoolViewModel

        init(modelContext: ModelContext) {
            let viewModel = InsertSchoolViewModel(modelContext: modelContext)
            _viewModel = StateObject(wrappedValue: viewModel)
        }

        var body: some View {
            VStack(spacing: Constants.Spacing.medium) {
                TextField("Enter school name", text: $viewModel.schoolName)
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
    InsertSchoolView()
}
