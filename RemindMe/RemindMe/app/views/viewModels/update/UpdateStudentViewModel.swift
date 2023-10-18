//
//  UpdateStudentView.swift
//  RemindMe
//
//  Created by Tosun, Irem on 9.10.2023.
//

import Foundation
import SwiftUI

final class UpdateStudentViewModel: BasePersistentViewModel {
    @Inject private var schoolStorage: SchoolStorageProtocol
    @Published var schools: [School] = []
    @ObservedObject var studentToEdit: Student

    init(studentToEdit: Student) {
        self.studentToEdit = studentToEdit
    }

    func loadSchools() {
        do {
            schools = try schoolStorage.fetch()
        } catch {
            schools = []
        }
    }
}
