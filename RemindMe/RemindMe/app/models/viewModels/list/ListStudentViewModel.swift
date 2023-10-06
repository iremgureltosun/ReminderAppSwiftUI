//
//  ListStudentViewModel.swift
//  RemindMe
//
//  Created by Tosun, Irem on 5.10.2023.
//

import Foundation
import SwiftData
import SwiftUI

final class ListStudentViewModel: BasePersistentViewModel {
    @Published var list: [StudentModel] = []
    var studentReminderPersistenceManager: StudentPersistenceManagerProtocol = Inject().wrappedValue

    func loadItems() {
        do {
            list = try studentReminderPersistenceManager.fetch() ?? []
        } catch {
            list = []
        }
    }

    func delete(indexSet: IndexSet) throws {
        try studentReminderPersistenceManager.delete(indexSet: indexSet)
    }
}
