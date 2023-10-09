//
//  ListStudentView.swift
//  RemindMe
//
//  Created by Tosun, Irem on 5.10.2023.
//

import SwiftUI

struct ListStudentView: View {
    @StateObject var viewModel: ListStudentViewModel
    @State private var presentInsertStudent: Bool = false

    init() {
        let viewModel = ListStudentViewModel()
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        NavigationView {
            VStack {
                studentList
                    .onAppear {
                        viewModel.loadItems()
                    }
                    .sheet(isPresented: $presentInsertStudent, onDismiss: {
                        viewModel.loadItems()
                    }, content: {
                        InsertStudentView()
                    })
                Spacer()
            }
            .sheet(item: $viewModel.studentToEdit) { student in
                UpdateStudentView(studentToEdit: student)
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
            ForEach(viewModel.list, id: \.id) { student in
                getStudentCell(student)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        viewModel.studentToEdit = student
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

    @ViewBuilder private func getStudentCell(_ student: StudentModel) -> some View {
        HStack {
            Text(student.title)
                .foregroundColor(.blue)

            Spacer()

            Text(student.school?.schoolName ?? "")
                .foregroundColor(.blue)
                .multilineTextAlignment(.trailing)
        }
    }
}

#Preview {
    ListStudentView()
        .modelContainer(for: StudentModel.self)
}
