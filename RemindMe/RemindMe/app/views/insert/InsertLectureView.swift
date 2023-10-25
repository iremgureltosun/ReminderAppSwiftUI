//
//  ReminderListView.swift
//  RemindMe
//
//  Created by Tosun, Irem on 3.10.2023.
//

import SwiftUI

struct InsertLectureView: View {
    @StateObject var viewModel: InsertLectureViewModel
    @Environment(\.dismiss) private var dismiss

    private var isFormValid: Bool {
        !viewModel.title.isEmptyOrWhiteSpace
    }

    init() {
        let viewModel = InsertLectureViewModel()
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        NavigationView {
            Form {
                TextField("Lecture name", text: $viewModel.title)

                TextField("Description", text: $viewModel.subtitle)
            }
            .background(.red)
            .navigationTitle("Add Lecture")
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
