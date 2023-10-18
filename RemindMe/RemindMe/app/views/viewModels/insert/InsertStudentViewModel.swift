//
//  InsertStudentViewModel.swift
//  RemindMe
//
//  Created by Tosun, Irem on 5.10.2023.
//

import Foundation
import SwiftUI

final class InsertStudentViewModel: BasePersistentViewModel {
    @Published var name: String = ""
    @Published var surname: String = ""
    @Inject private var studentStorageManager: StudentStorageProtocol
    @Inject private var schoolStorageManager: SchoolStorageProtocol
    @Published var selectedSchool: School?
    @Published var schools: [School] = []

    func save() {
        do {
            let student = Student(id: UUID().uuidString, name: name, surname: surname, school: selectedSchool)
            try studentStorageManager.save(student)
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
            schools = try schoolStorageManager.fetch()
            selectedSchool = schools.first
        } catch {
            schools = []
        }
    }
}
