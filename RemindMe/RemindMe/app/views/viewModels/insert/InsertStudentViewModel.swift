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

    func save() {
        do {
            let student = Student(id: UUID().uuidString, name: name, surname: surname, school: nil)
            try studentStorageManager.save(student)

            showSuccess = true
        } catch {
            showAlert = true
            debugPrint(error)
            if let error = error as? PersistenceError {
                errorMessage = error.description
            } else {
                errorMessage = error.localizedDescription
            }
        }
    }
}
