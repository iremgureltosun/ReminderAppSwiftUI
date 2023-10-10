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
    @Published var schools: [School] = []
    @ObservedObject var studentToEdit: Student

    init(studentToEdit: Student) {
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
