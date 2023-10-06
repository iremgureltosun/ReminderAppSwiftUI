//
//  InsertSchoolView.swift
//  RemindMe
//
//  Created by Tosun, Irem on 6.10.2023.
//

import SwiftData
import SwiftUI

struct InsertSchoolView: View {
    @StateObject var viewModel: InsertSchoolViewModel
    @Environment(\.dismiss) private var dismiss

    private var isFormValid: Bool {
        !viewModel.schoolName.isEmptyOrWhiteSpace
    }

    init() {
        let viewModel = InsertSchoolViewModel()
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        NavigationView {
            Form {
                TextField("School name", text: $viewModel.schoolName)

                TextField("Description", text: $viewModel.description)
            }
            .background(.red)
            .navigationTitle("Add School")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Close") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Save") {
                        viewModel.save()
                        dismiss()

                    }.disabled(!isFormValid)
                }
            }
            .padding(Constants.Spacing.large)
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

//#Preview {
//    InsertSchoolView()
//}
