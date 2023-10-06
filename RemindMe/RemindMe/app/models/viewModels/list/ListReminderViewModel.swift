//
//  StoredRemindersListView.swift
//  RemindMe
//
//  Created by Tosun, Irem on 4.10.2023.
//

import Foundation
import SwiftData
import SwiftUI

final class ListReminderViewModel: BasePersistentViewModel {
    @Published var list: [ReminderModel] = []
    var reminderReminderPersistenceManager: ReminderPersistenceManagerProtocol = Inject().wrappedValue

    func loadItems() {
        do {
            list = try reminderReminderPersistenceManager.fetch()
        } catch {
            list = []
        }
    }

    func delete(indexSet: IndexSet) {
        // ListViewModel(modelContext: modelContext).reminderReminderPersistenceManager.delete(indexSet: indexSet)
    }
}
