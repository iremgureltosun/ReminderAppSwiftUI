//
//  UpdateStudentView.swift
//  RemindMe
//
//  Created by Tosun, Irem on 9.10.2023.
//

import SwiftUI

struct UpdateStudentView: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject var viewModel: UpdateStudentViewModel

    private var isFormValid: Bool {
        true
    }

    init(studentToEdit: Student) {
        let viewModel = UpdateStudentViewModel(studentToEdit: studentToEdit)
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        NavigationView {
            Form {
                TextField("Student's name", text: $viewModel.studentToEdit.name)

                TextField("Student's surname", text: $viewModel.studentToEdit.surname)

                Picker(selection: $viewModel.studentToEdit.school, label: Text("School")) {
                    ForEach(viewModel.schools) { school in
                        Text(school.schoolName).tag(Optional(school))
                    }
                }
            }
            .background(.red)
            .navigationTitle("Update Student")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Close") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Save") {
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

// #Preview {
//   // UpdateStudentView()
// }
