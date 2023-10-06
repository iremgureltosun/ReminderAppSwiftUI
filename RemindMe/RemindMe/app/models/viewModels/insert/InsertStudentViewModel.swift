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

    @MainActor
    struct InsertViewModel {
        var studentReminderPersistenceManager: StudentPersistenceManagerProtocol
        var modelContext: ModelContext
        
        init(modelContext: ModelContext) {
            self.modelContext = modelContext
            studentReminderPersistenceManager = Inject(context: modelContext).wrappedValue
        }
    }
    
    func save() {
        do {
            let student = StudentModel(name: name, surname: surname)
            try InsertViewModel(modelContext: modelContext).studentReminderPersistenceManager.save(student)
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
