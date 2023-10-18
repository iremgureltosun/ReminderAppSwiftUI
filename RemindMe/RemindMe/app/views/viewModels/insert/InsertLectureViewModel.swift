import Foundation
import SwiftUI

final class InsertLectureViewModel: BasePersistentViewModel {
    @Published var title: String = ""
    @Published var subtitle: String = ""
    @Inject private var storageManager: LectureStorageProtocol
    @Published var items: [Lecture] = []

    func save() {
        do {
            let lecture = Lecture(id: UUID().uuidString, title: title, subtitle: subtitle)
            try storageManager.save(lecture)
            showSuccess = true
        } catch {
            showAlert = true
            if let error = error as? PersistenceError {
                errorMessage = error.description
            } else {
                errorMessage = error.localizedDescription
            }
        }
    }

    func loadItems() {
        do {
            items = try storageManager.fetch()
        } catch {
            items = []
        }
    }
}
