//
//  StoredRemindersListView.swift
//  RemindMe
//
//  Created by Tosun, Irem on 4.10.2023.
//

import Foundation
import SwiftData
import SwiftUI

@MainActor
final class RemindersListViewModel: ObservableObject {
    var modelContext: ModelContext
    @Published var list: [ReminderModel] = []
    init(modelContext: ModelContext) {
        self.modelContext = modelContext
    }

    func loadItems() {
        do {
            list = try FetchViewModel(modelContext: modelContext).reminderReminderPersistenceManager.fetch()
        } catch {
            list = []
        }
    }

    @MainActor
    struct FetchViewModel {
        var reminderReminderPersistenceManager: ReminderPersistenceManagerProtocol
        var modelContext: ModelContext

        init(modelContext: ModelContext) {
            self.modelContext = modelContext
            reminderReminderPersistenceManager = Inject(context: modelContext).wrappedValue
        }
    }
}
