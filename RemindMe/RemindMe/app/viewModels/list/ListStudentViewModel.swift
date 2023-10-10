//
//  ListStudentViewModel.swift
//  RemindMe
//
//  Created by Tosun, Irem on 5.10.2023.
//

import Foundation
import SwiftUI

final class ListStudentViewModel: BasePersistentViewModel {
    @Published var list: [StudentModel] = []
    @Inject var studentReminderPersistenceManager: StudentPersistenceManagerProtocol 
    @Published var studentToEdit: StudentModel?

    func loadItems() {
        do {
            list = try studentReminderPersistenceManager.fetch()
        } catch {
            list = []
        }
    }

    func delete(indexSet: IndexSet) throws {
        try studentReminderPersistenceManager.delete(indexSet: indexSet)
    }
}
