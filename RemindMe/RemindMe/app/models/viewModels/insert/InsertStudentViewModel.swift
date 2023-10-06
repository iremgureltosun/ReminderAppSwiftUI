//
//  InsertStudentViewModel.swift
//  RemindMe
//
//  Created by Tosun, Irem on 5.10.2023.
//

import Foundation
import SwiftData
import SwiftUI

final class InsertStudentViewModel: BasePersistentViewModel {
    @Published var name: String = ""
    @Published var surname: String = ""
    @Inject var studentReminderPersistenceManager: StudentPersistenceManagerProtocol
    
    func save() {
        do {
            let student = StudentModel(name: name, surname: surname)
            try studentReminderPersistenceManager.save(student)
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
}
