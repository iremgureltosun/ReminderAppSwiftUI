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
    @Inject private var studentPersistenceManager: StudentPersistenceManagerProtocol
    @Inject private var schoolPersistenceManager: SchoolPersistenceManagerProtocol
    @Published var selectedSchool: SchoolModel?
    @Published var schools: [SchoolModel] = []

    func save() {
        do {
            let student = StudentModel(name: name, surname: surname, school: selectedSchool)
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
