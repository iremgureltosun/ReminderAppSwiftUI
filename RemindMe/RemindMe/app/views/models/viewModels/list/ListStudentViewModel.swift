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
    @Inject var studentReminderPersistenceManager: StudentManagerProtocol
    @Published var studentToEdit: Student?

    func loadItems() {
        do {
            list = try studentReminderPersistenceManager.fetch()
        } catch {
            list = []
        }
    }

    func delete(indexSet: IndexSet) throws {
        try indexSet.forEach { index in
            let item = list[index]
            try studentReminderPersistenceManager.delete(item)
        }
    }
}
