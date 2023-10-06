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
    @Inject var schoolReminderPersistenceManager: SchoolPersistenceManagerProtocol

    func save() {
        do {
            let school = SchoolModel(schoolName: schoolName, schoolCategoryId: nil, schoolDescription: description)
            try schoolReminderPersistenceManager.save(school)
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
