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

    func loadItems() {
        do {
            list = try ListViewModel(modelContext: modelContext).reminderReminderPersistenceManager.fetch()
        } catch {
            list = []
        }
    }

    @MainActor
    struct ListViewModel {
        var reminderReminderPersistenceManager: ReminderPersistenceManagerProtocol
        var modelContext: ModelContext

        init(modelContext: ModelContext) {
            self.modelContext = modelContext
            reminderReminderPersistenceManager = Inject(context: modelContext).wrappedValue
        }
    }
}