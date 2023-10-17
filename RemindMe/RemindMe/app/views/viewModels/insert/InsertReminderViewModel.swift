import Foundation
import SwiftUI

final class InsertLectureViewModel: BasePersistentViewModel {
    @Published var name: String = ""
    @Published var surname: String = ""
    @Inject private var studentPersistenceManager: StudentManagerProtocol
    @Inject private var schoolPersistenceManager: SchoolManagerProtocol
    @Published var selectedSchool: School?
    @Published var schools: [School] = []

    func save() {
        do {
            let student = Student(id: UUID().uuidString, name: name, surname: surname, school: selectedSchool)
            try studentPersistenceManager.save(student)
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

    func loadSchools() {
        do {
            schools = try schoolPersistenceManager.fetch()
            selectedSchool = schools.first
        } catch {
            schools = []
        }
    }
}

