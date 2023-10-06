//
//  InsertSchoolViewModel.swift
//  RemindMe
//
//  Created by Tosun, Irem on 5.10.2023.
//

import Foundation
import SwiftData
import SwiftUI

final class InsertSchoolViewModel: BasePersistentViewModel {
    @Published var schoolName: String = ""
    @Published var description: String = ""

    @MainActor
    struct InsertViewModel {
        var schoolReminderPersistenceManager: SchoolPersistenceManagerProtocol
        var modelContext: ModelContext

        init(modelContext: ModelContext) {
            self.modelContext = modelContext
            schoolReminderPersistenceManager = Inject(context: modelContext).wrappedValue
        }
    }

    func save() {
        do {
            let school = SchoolModel(schoolName: schoolName, schoolCategoryId: nil, schoolDescription: description)
            try InsertViewModel(modelContext: modelContext).schoolReminderPersistenceManager.save(school)
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
