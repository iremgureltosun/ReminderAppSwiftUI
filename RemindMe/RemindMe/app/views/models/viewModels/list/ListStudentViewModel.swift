//
//  ListStudentViewModel.swift
//  RemindMe
//
//  Created by Tosun, Irem on 5.10.2023.
//

import Foundation
import SwiftUI

final class ListStudentViewModel: BasePersistentViewModel {
    @Published var list: [Student] = []
    @Inject var studentReminderPersistenceManager: StudentPersistenceManagerProtocol 
    @Published var studentToEdit: Student?

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
