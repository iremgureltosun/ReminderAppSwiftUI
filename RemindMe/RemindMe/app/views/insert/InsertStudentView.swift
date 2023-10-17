//
//  InsertStudentView.swift
//  RemindMe
//
//  Created by Tosun, Irem on 5.10.2023.
//

import SwiftUI

struct InsertStudentView: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject var viewModel: InsertStudentViewModel

    private var isFormValid: Bool {
        !viewModel.name.isEmptyOrWhiteSpace && !viewModel.surname.isEmptyOrWhiteSpace
    }

    init() {
        let viewModel = InsertStudentViewModel()
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        NavigationView {
            Form {
                TextField("Student's name", text: $viewModel.name)

                TextField("Student's surname", text: $viewModel.surname)

                Picker(selection: $viewModel.selectedSchool, label: Text("School")) {
                    ForEach(viewModel.schools) { school in
                        Text(school.schoolName).tag(Optional(school))
                    }
                }
            }
            .background(.red)
            .navigationTitle("Add Student")
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
            .onAppear {
                viewModel.loadSchools()
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

#Preview {
    InsertStudentView()
}
