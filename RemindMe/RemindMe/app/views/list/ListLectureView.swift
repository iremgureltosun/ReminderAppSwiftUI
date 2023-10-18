
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
                lectureList
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

    @ViewBuilder private var lectureList: some View {
        List {
            ForEach(viewModel.list, id: \.id) { lecture in
                HStack {
                    Text(lecture.title)
                        .foregroundColor(.blue)
                }
                .contentShape(Rectangle())
                .swipeActions {
                    Button("Delete", systemImage: "trash", role: .destructive) {
                        do {
                            try viewModel.delete(lecture)
                        } catch {
                            debugPrint(error)
                        }
                    }
                }
            }
        }
    }
}
