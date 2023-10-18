
import SwiftUI

struct ListLectureView: View {
    @StateObject var viewModel: ListLectureViewModel
    @State private var presentInsertLecture: Bool = false

    init() {
        let viewModel = ListLectureViewModel()
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        NavigationView {
            VStack {
                studentList
                    .onAppear {
                        viewModel.loadItems()
                    }
                    .sheet(isPresented: $presentInsertLecture, onDismiss: {
                        viewModel.loadItems()
                    }, content: {
                        InsertLectureView()
                    })
                Spacer()
            }
            .toolbar(content: {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add Lecture") {
                        presentInsertLecture = true
                    }
                }
            })
        }
    }

    @ViewBuilder private var studentList: some View {
        List {
            ForEach(viewModel.list, id: \.id) { student in
                getLectureCell(student)
                    .contentShape(Rectangle())
                   
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

    @ViewBuilder private func getLectureCell(_ lecture: Lecture) -> some View {
        HStack {
            Text(lecture.title)
                .foregroundColor(.blue)
        }
    }
}
