//
//  UpdateStudentView.swift
//  RemindMe
//
//  Created by Tosun, Irem on 9.10.2023.
//

import Foundation
import SwiftUI

final class UpdateStudentViewModel: BasePersistentViewModel {
    @Inject private var studentPersistenceManager: StudentPersistenceManagerProtocol
    @Inject private var schoolPersistenceManager: SchoolPersistenceManagerProtocol
    @Published var schools: [SchoolModel] = []
    @Bindable var studentToEdit: StudentModel

    init(studentToEdit: StudentModel) {
        self.studentToEdit = studentToEdit
    }

    func loadSchools() {
        do {
            schools = try schoolPersistenceManager.fetch()
        } catch {
            schools = []
        }
    }
}
