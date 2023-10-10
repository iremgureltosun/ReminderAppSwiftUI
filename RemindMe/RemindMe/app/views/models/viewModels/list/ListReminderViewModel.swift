//
//  StoredRemindersListView.swift
//  RemindMe
//
//  Created by Tosun, Irem on 4.10.2023.
//

import Foundation
import SwiftUI

final class ListReminderViewModel: BasePersistentViewModel {
    @Published var list: [Reminder] = []
    @Inject private var reminderReminderPersistenceManager: ReminderPersistenceManagerProtocol

    func loadItems() {
        do {
            list = try reminderReminderPersistenceManager.fetch()
        } catch {
            list = []
        }
    }

    func delete(indexSet: IndexSet) throws {
        try reminderReminderPersistenceManager.delete(indexSet: indexSet)
    }
}
